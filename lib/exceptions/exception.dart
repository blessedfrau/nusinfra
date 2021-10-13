class MsgException implements Exception {
  final String message;

  MsgException(this.message);

  @override
  String toString() => message;
}

class HttpCodeException extends MsgException {
  HttpCodeException(String message) : super(message);
}
