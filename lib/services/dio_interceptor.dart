import "package:dio/dio.dart";
import "package:jobapp/common/app_constant.dart";
import "package:jobapp/services/local_storage.dart";

Dio dioService() {
  Dio dio = Dio(
    BaseOptions(baseUrl: AppConstants.appURL),
  );
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = localStorage.read('token');

      if (token != null) {
        options.headers['Authorization'] = "Bearer $token";
      }
      return handler.next(options);
    },
    onResponse: (response, handler) {
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      return handler.next(e);
    },
  ));
  return dio;
}
