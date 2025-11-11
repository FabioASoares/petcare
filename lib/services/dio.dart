import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petcenter/core/crashlytics/crashlytics.dart';

final Interceptor _interceptor = InterceptorsWrapper(
  onRequest: (
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) =>
      requestInterceptor(options, handler),
  onResponse: (
    Response response,
    ResponseInterceptorHandler handler,
  ) =>
      responseInterceptor(response, handler),
  onError: (
    DioException dioError,
    ErrorInterceptorHandler handler,
  ) =>
      errorInterceptor(dioError, handler),
);

Dio addInterceptors(Dio dio) {
  if (!dio.interceptors.contains(_interceptor)) {
    dio.interceptors.add(_interceptor);
  }
  return dio;
}

void printColorized(String text, String url, {int color = 32}) {
  if (kDebugMode) {
    final textoAbreviado = abbreviate(text, 5000);
    log('\x1B[${color}m$textoAbreviado\x1B[0m');
  }
  Crashlytics.iniciarLogs();
}

String abbreviate(String input, int maxLength) {
  var it = input.characters.iterator;
  for (var i = 0; i <= maxLength; i++) {
    if (!it.expandNext()) return input;
  }
  it.dropLast(2);
  return "${it.current}\u2026";
}

String mapToJson(dynamic map) {
  if (map is! Map) {
    return map.toString();
  }
  return json.encode(map);
}

dynamic requestInterceptor(
  RequestOptions options,
  RequestInterceptorHandler handler,
) async {
  String data = '';
  if (options.data is FormData) {
    data = mapToJson(options.data.fields);
  } else {
    data = mapToJson(options.data);
  }
  printColorized(
      'URL REQUEST: ${options.path}, TYPE REQUEST: ${options.method}, REQUEST DATA: $data',
      options.path);
  handler.next(options);
  return options;
}

dynamic responseInterceptor(
  Response response,
  ResponseInterceptorHandler handler,
) async {
  handler.next(response);
  printColorized(
    'URL RESPONSE: ${response.realUri}, RESPONSE STATUSCODE: ${response.statusCode}, RESPONSE DATA: ${response.data}',
    response.realUri.toString(),
    color: 33,
  );

  return response;
}

dynamic errorInterceptor(
  DioException dioError,
  ErrorInterceptorHandler handler,
) async {
  String urlResponse = dioError.response?.realUri.toString() ?? '';
  dynamic responseData = dioError.response?.data;
  int? responseStatusCode = dioError.response?.statusCode;
  String typedStatus = statusTypedReturn(responseStatusCode);
  String messageApi = 'URL RESPONSE: $urlResponse';

  if (responseData is Map<String, dynamic>) {
    messageApi +=
        ', message: ${responseData['mensagem']}, error: ${responseData['codigoErro']}, statusCode: $responseStatusCode - $typedStatus';
  } else {
    messageApi += ', responseData: ${responseData?.toString()}';
  }

  if (messageApi.isEmpty) {
    messageApi = dioError.message ?? 'Erro desconhecido';
  }

  printColorized('ERROR: $messageApi', urlResponse, color: 31);
  handler.next(dioError);
  return dioError;
}

String statusTypedReturn(int? code) {
  const Map<int, TypeStatusCode> statusCodeMap = {
    400: TypeStatusCode.badRequest,
    401: TypeStatusCode.unauthorized,
    404: TypeStatusCode.notFound,
    500: TypeStatusCode.internalError,
    503: TypeStatusCode.serviceError,
  };

  return statusCodeMap[code]?.error ?? TypeStatusCode.serviceError.error;
}

enum TypeStatusCode {
  badRequest(400, "Bad Request"),
  unauthorized(401, "Unauthorized"),
  notFound(404, "Not Found"),
  internalError(500, "Internal Error"),
  serviceError(503, "Service Error");

  final int code;
  final String error;

  const TypeStatusCode(
    this.code,
    this.error,
  );
}
