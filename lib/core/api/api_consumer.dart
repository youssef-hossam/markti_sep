import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:markti/core/api/api_error_handler.dart';
import 'package:markti/core/utils/cache/cache_constants.dart';
import 'package:markti/core/utils/cache/cache_helper.dart';

class ApiConsumer {
  final Dio dio;

  ApiConsumer({required this.dio}) {
    dio.options.baseUrl = 'https://accessories-eshop.runasp.net';

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
    ));
  }

  // Method to perform a GET request
  Future<Either<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.get(path,
          queryParameters: queryParameters,
          data: data,
          options: Options(headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getSecureData(key: CacheConstants.accessToken)}',
          }));
      return Right(response.data);
    } on DioException catch (e) {
      return Left(handleApiError(e));
      // TODO
    }
  }

  // Method to perform a POST request
  Future<Either<String, dynamic>> post(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      Response response =
          await dio.post(path, queryParameters: queryParameters, data: data);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(handleApiError(e));

      // TODO
    }
  }

  // Method to perform a PATCH request
  Future<dynamic> patch(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    Response response =
        await dio.patch(path, queryParameters: queryParameters, data: data);
    return response.data;
  }

  // Method to perform a DELETE request
  Future<dynamic> delete(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    Response response =
        await dio.delete(path, queryParameters: queryParameters, data: data);
    return response.data;
  }
}
