class GeneralExceptionClass implements Exception {
  final String errorMessage;
  GeneralExceptionClass(this.errorMessage);
}

class NoInternetException extends GeneralExceptionClass {
  final String error;
  NoInternetException(this.error) : super(error);
}

class NotFoundException extends GeneralExceptionClass {
  final String error;
  NotFoundException(this.error) : super(error);
}

class BadRequestException extends GeneralExceptionClass {
  final String error;
  BadRequestException(this.error) : super(error);
}

class UnAuthorizedException extends GeneralExceptionClass {
  final String error;
  UnAuthorizedException(this.error) : super(error);
}

class ServerException extends GeneralExceptionClass {
  final String error;
  ServerException(this.error) : super(error);
}

class CancelledRequestException extends GeneralExceptionClass {
  final String error;
  CancelledRequestException(this.error) : super(error);
}

class OtherException extends GeneralExceptionClass {
  final String error;
  OtherException(this.error) : super(error);
}
