import 'package:dio/dio.dart';
import 'package:pokedex_technical_test/src/core/config/client/api_interceptor.dart';

class ApiClient with DioMixin implements Dio {
  ApiClient() {
    options = BaseOptions();
    httpClientAdapter = HttpClientAdapter();
    interceptors.add(ApiInterceptor());
  }
}