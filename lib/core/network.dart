import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:twekl_test_app/core/exceptions.dart';
import 'package:twekl_test_app/core/strings.dart';

class DioClass {
  late Dio dio;

  void init() {
    dio = Dio();
    dio.options.baseUrl = "https://fakestoreapi.com";
  }

  Future<bool> checkInternet() async {
    return await InternetConnectionChecker().hasConnection;
  }

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic> query = const {},
  }) async {
    if (await checkInternet()) {
      try {
        final Response response = await dio.get(
          endPoint,
          queryParameters: query,
        );

        return response.data;
      } on DioError catch (error) {
        HandleDioError(error);
      }
    } else {
      throw NoInternetException(noInternetError);
    }
  }

  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic> query = const {},
    Map<String, dynamic> body = const {},
  }) async {
    if (await checkInternet()) {
      try {
        final Response response = await dio.post(
          endPoint,
          queryParameters: query,
          data: body,
        );

        return response.data;
      } on DioError catch (error) {
        HandleDioError(error);
      }
    } else {
      throw NoInternetException(noInternetError);
    }
  }
}

class HandleDioError {
  final DioError error;

  HandleDioError(this.error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw NoInternetException(noInternetError);
      case DioErrorType.cancel:
        throw CancelledRequestException(requestCancelledError);
      case DioErrorType.other:
        throw OtherException(otherError);
      case DioErrorType.response:
        final Response? response = error.response;
        if (response != null) {
          throw handleResponseError(response);
        } else {
          throw OtherException(noResponseError);
        }

      default:
        throw OtherException('Something Wrong with response');
    }
  }

  GeneralExceptionClass handleResponseError(Response response) {
    switch (response.statusCode) {
      case 400:
        return BadRequestException(badRequestError);

      case 401:
      case 403:
        return UnAuthorizedException(notAuthorizedError);

      case 404:
        return NotFoundException(notFoundError);
      case 500:
        return ServerException(serverError);
      default:
        throw OtherException(
          'Something Wrong with response :: status code = ${response.statusCode}',
        );
    }
  }
}
