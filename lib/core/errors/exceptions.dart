import 'package:dio/dio.dart';

import 'error_model.dart';

abstract class AppException implements Exception {
  final ErrorModel errorModel;
  AppException(this.errorModel);
}

class ServerException extends AppException {
  ServerException(super.errorModel);
}

class CacheException extends AppException {
  CacheException(super.errorModel);
}

class CustomException implements Exception {
  final String errorMessage;

  CustomException({required this.errorMessage});
  @override
  String toString() => errorMessage;
}

class BadCertificateException extends ServerException {
  BadCertificateException(super.errorModel);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(super.errorModel);
}

class BadResponseException extends ServerException {
  BadResponseException(super.errorModel);
}

class ReceiveTimeoutException extends ServerException {
  ReceiveTimeoutException(super.errorModel);
}

class ConnectionErrorException extends ServerException {
  ConnectionErrorException(super.errorModel);
}

class SendTimeoutException extends ServerException {
  SendTimeoutException(super.errorModel);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.errorModel);
}

class ForbiddenException extends ServerException {
  ForbiddenException(super.errorModel);
}

class NotFoundException extends ServerException {
  NotFoundException(super.errorModel);
}

class CofficientException extends ServerException {
  CofficientException(super.errorModel);
}

class CancelException extends ServerException {
  CancelException(super.errorModel);
}

class UnknownException extends ServerException {
  UnknownException(super.errorModel);
}

handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      throw ConnectionErrorException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request

          throw BadResponseException(ErrorModel.fromJson(e.response!.data));

        case 401: //unauthorized
          throw UnauthorizedException(ErrorModel.fromJson(e.response!.data));

        case 403: //forbidden
          throw ForbiddenException(ErrorModel.fromJson(e.response!.data));

        case 404: //not found
          // Handle case where response data might not be in expected format
          try {
            throw NotFoundException(ErrorModel.fromJson(e.response!.data));
          } catch (error) {
            throw NotFoundException(ErrorModel(
              errorMessage: 'Resource not found: ${e.requestOptions.path}',
            ));
          }

        case 409: //cofficient
          throw CofficientException(ErrorModel.fromJson(e.response!.data));

        case 504: // Bad request
          throw BadResponseException(ErrorModel.fromJson(e.response!.data));
      }

    case DioExceptionType.cancel:
      throw CancelException(ErrorModel(errorMessage: e.toString()));

    case DioExceptionType.unknown:
      throw UnknownException(ErrorModel(
        errorMessage: e.toString(),
      ));
  }
}
