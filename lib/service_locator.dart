import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nusantarainfra/utils/constants.dart';

import 'exceptions/exception.dart';
import 'model/http_status_code.dart';
import 'services/auth_service.dart';
import 'services/auth_service_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(
      dio: sl(),
      storage: sl(),
    ),
  );
  sl.registerLazySingleton(() {
    final BaseOptions options = BaseOptions(
      baseUrl: 'https://testapi.nusantarainfrastructure.com/api',
    );

    Dio dio = Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (request, handler) async {
      request.headers[HttpHeaders.contentTypeHeader] ??=
          Headers.jsonContentType;
      request.headers[HttpHeaders.acceptHeader] ??= Headers.jsonContentType;

      final token =
          await sl<FlutterSecureStorage>().read(key: AuthKey.token.toString());
      request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';

      return handler.next(request);
    }, onError: (e, handler) {
      final response = e.response;
      if (e.type == DioErrorType.response) {
        String message = e.message;
        if (response!.data.toString().isNotEmpty) {
          message = HttpStatusCode.fromJson(response.data).detail;
        }
        var statusCode = response.statusCode;
        if (statusCode == 401) {
          throw HttpCodeException('Not Authorized. $message');
        }
      }
    }, onResponse: (response, handler) async {
      return handler.next(response);
    }));

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };

    return dio;
  });
}
