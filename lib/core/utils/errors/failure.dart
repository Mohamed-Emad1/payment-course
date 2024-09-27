import 'package:dio/dio.dart';

abstract class Faulire {
  final String message;

  Faulire({required this.message});
}

class ServerFailure extends Faulire {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(message: "Bad certificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            error.response!.statusCode!, error.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(message: "Request to ApiServer was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure(message: "Connection error");
      case DioExceptionType.unknown:
        return ServerFailure(message: "Unknown error, please try again later");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(message: "Your request not found");
    } else if (statusCode == 500) {
      return ServerFailure(message: "Internal server error");
    } else {
      return ServerFailure(message: "Something went wrong");
    }
  }
}
