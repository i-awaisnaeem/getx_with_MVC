class AppExceptions implements Exception {
  final String? message;
  final String? prefix;

  AppExceptions([this.message, this.prefix]);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message])
      : super( message,  'Invalid Request');
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
      : super( message,  'Unauthorised Request');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
      : super( message,  'Invalid Input');
}

class InternetException extends AppExceptions{
  InternetException([String? message])
      : super(message, 'No Internet');
}

class RequestTimeOut extends AppExceptions{
  RequestTimeOut([String? message])
      : super(message, 'Request Time Out');
}

class ServerException extends AppExceptions{
  ServerException([String? message])
      : super(message, 'Internal Server Error');
}