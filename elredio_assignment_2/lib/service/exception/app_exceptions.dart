class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, "Unauthorised: ");
}

class SessionExpiredException extends AppException {
  SessionExpiredException([String? message]) : super(message, "Unauthorised: ");
}

class RequestCancelledException extends AppException {
  RequestCancelledException([String? message]) : super(message, "Unauthorised: ");
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, "Unauthorised: ");
}

class SocketException extends AppException {
  SocketException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException({required String message})
      : super(message, "Invalid Input: ");
}
