import 'dart:convert';

import 'package:dio/dio.dart';

import 'dio.dart';
import 'response_custom.dart';

abstract class GetServices {
  Future<ResponseCustom> getRequest(
    String urlString,
    Map<String, dynamic>? queryParameters,
  );
}

abstract class PostServices {
  Future<ResponseCustom> postRequest(
    String urlString,
    Object? json,
  );

  Future<ResponseCustom> postFormDataRequest(
    String urlString,
    FormData formData,
  );
}

abstract class DeleteServices {
  Future<ResponseCustom> deleteRequest(
    String urlString,
  );
}

abstract class PutServices {
  Future<ResponseCustom> putRequest(
    String urlString,
    Map<String, dynamic> json,
  );
}

class ServicesImpl
    implements GetServices, PostServices, PutServices, DeleteServices {
  Dio _dio;

  ServicesImpl(this._dio) {
    _dio = addInterceptors(_dio);
    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
    );
  }

  @override
  Future<ResponseCustom> deleteRequest(
    String urlString,
  ) async {
    try {
      final response = await _dio.delete(urlString);
      return ResponseCustom(
        statusCode: response.statusCode!,
        data: response.data,
      );
    } catch (error) {
      if (error is DioException) {
        return _getError(error);
      }
      rethrow;
    }
  }

  @override
  Future<ResponseCustom> getRequest(
    String urlString,
    Map<String, dynamic>? queryParameters,
  ) async {
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
      };

      Response response = await _dio.get(
        urlString,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );

      final Map<String, List<String>> headersMap = {};
      response.headers.forEach((key, values) {
        headersMap[key] = List<String>.from(values);
      });

      return ResponseCustom(
        statusCode: response.statusCode!,
        data: response.data,
        headers: headersMap,
      );
    } catch (error) {
      if (error is DioException) {
        return _getError(error);
      }
      rethrow;
    }
  }

  @override
  Future<ResponseCustom> postRequest(
    String urlString,
    Object? body,
  ) async {
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
      };

      final response = await _dio.post(
        urlString,
        options: Options(headers: header),
        data: body,
      );

      final Map<String, List<String>> headersMap = {};
      response.headers.forEach((key, values) {
        headersMap[key] = List<String>.from(values);
      });

      return ResponseCustom(
        statusCode: response.statusCode!,
        data: response.data,
        headers: headersMap,
      );
    } catch (error) {
      if (error is DioException) {
        return _getError(error);
      }
      rethrow;
    }
  }

  @override
  Future<ResponseCustom> postFormDataRequest(
    String urlString,
    FormData formData,
  ) async {
    try {
      final response = await _dio.post(
        urlString,
        data: formData,
      );
      return ResponseCustom(
        statusCode: response.statusCode,
        data: response.data,
      );
    } catch (error) {
      if (error is DioException) {
        return _getError(error);
      }
      rethrow;
    }
  }

  @override
  Future<ResponseCustom> putRequest(
      String urlString, Map<String, dynamic> json) async {
    try {
      final headers = {
        "Content-type": "application/json",
      };
      final response = await _dio.put(
        urlString,
        options: Options(headers: headers),
        data: json,
      );
      return ResponseCustom(
        statusCode: response.statusCode,
        data: response.data,
      );
    } catch (error) {
      if (error is DioException) {
        return _getError(error);
      }
      rethrow;
    }
  }
}

extension on ServicesImpl {
  ResponseCustom _getError(DioException error) {
    if (error.response?.statusCode != null &&
        error.response!.statusCode! >= 500 &&
        error.response!.statusCode! <= 599) {
      return ResponseCustom(
        statusCode: error.response?.statusCode,
        data: {'error': 'Erro interno no servidor'},
      );
    }

    return ResponseCustom(
      statusCode: error.response?.statusCode,
      data: error.response?.data,
    );
  }
}
