abstract class ApiBase {
  final Dio _dio = Dio();

  ApiBase() {
    _dio.options.baseUrl = 'https://your-api.com';
    _dio.interceptors.add(LogInterceptor());
  }

  Future<Response> get(String path, {Map<String, dynamic>? params}) async {
    try {
      return await _dio.get(path, queryParameters: params);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(DioError error) {
    // Обработка различных ошибок
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        throw NetworkException('Таймаут соединения');
      case DioErrorType.sendTimeout:
        throw NetworkException('Таймаут отправки');
      case DioErrorType.receiveTimeout:
        throw NetworkException('Таймаут получения');
      case DioErrorType.badResponse:
        throw ServerException('Ошибка сервера: ${error.response?.statusCode}');
      default:
        throw NetworkException('Сетевая ошибка');
    }
  }
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
