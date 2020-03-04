import 'package:dio/dio.dart';

class ApiClient {
  static Dio get() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
    );

    return Dio(options);
  }
}
