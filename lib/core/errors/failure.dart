import 'package:dio/dio.dart';

class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection time out');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send time out');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive time out');

      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Certificate was bad !');

      case DioExceptionType.badResponse:
        final data = dioError.response?.data;
        final statusCode = dioError.response?.statusCode;
        if (data != null && statusCode != null) {
          return ServerFailure.fromResponse(statusCode, data);
        } else {
          return ServerFailure(errMessage: 'Unexpected server response .');
        }
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Order has been cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No internet connection !');

      case DioExceptionType.unknown:
        return ServerFailure(
          errMessage: 'Error was unknown , Please try again !',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        errMessage: response['error']?['message'] is Map
            ? response['error']['message'] ?? 'Something went wrong !'
            : 'Something went wrong !',
      );
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: 'Request was not found ! Try later .');
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: 'Internal Server Error ! Try later .');
    } else {
      return ServerFailure(
        errMessage: 'Ops there was an error ! Please try again .',
      );
    }
  }
}
