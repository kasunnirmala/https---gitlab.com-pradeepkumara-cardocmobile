import 'package:cardoc/util/dio/interceptors/token_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  Dio getDio() {
    final Dio dio = Dio()
      ..options = BaseOptions(baseUrl: "http://52.221.188.125");
    dio.interceptors.addAll([
      TokenInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
    return dio;
  }
}
