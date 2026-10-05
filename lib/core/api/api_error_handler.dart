import 'package:dio/dio.dart';
import 'package:markti/core/api/api_error_model.dart';

String handleApiError(DioException e) {
  String errorMessage = '';
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      errorMessage = 'Connection timeout. Please try again later.';
    case DioExceptionType.sendTimeout:
      errorMessage = 'Send timeout. Please try again later.';
    case DioExceptionType.receiveTimeout:

      errorMessage = 'Receive timeout. Please try again later.';

    case DioExceptionType.badCertificate:

      errorMessage = 'Bad certificate. Please check your connection.';
    case DioExceptionType.cancel:
    
      errorMessage = 'Request was cancelled. Please try again.';
    case DioExceptionType.connectionError:
 
      errorMessage = 'Connection error. Please try again later.';

    case DioExceptionType.unknown:

      errorMessage = 'An unknown error occurred. Please try again later.';
    case DioExceptionType.transformTimeout:
      
      errorMessage = 'Transform timeout. Please try again later.';

    case DioExceptionType.badResponse:
      ApiErrorModel errorModel = ApiErrorModel.fromJson(e.response!.data);
      errorMessage = errorModel.errors;
  }
  return errorMessage;
}
