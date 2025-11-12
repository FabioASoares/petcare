import 'package:petcare/core/helper/status_code_network_helper.dart';

class ResponseCustom {
  final int? statusCode;
  final dynamic data;
  final Map<String, List<String>>? headers;

  ResponseCustom({
    required this.statusCode,
    required this.data,
    this.headers,
  });

  StatusNetworkReturn get statusNetworkType =>
      getStatusCodeNetworkType(statusCode);
}

extension ResponseCustomExt on ResponseCustom {
  String extractErrorMessage(String defaultMessage) {
    String? errorMessage =
        data != null ? (data['message'] ?? data['error']) : null;

    return errorMessage ?? defaultMessage;
  }
}

enum StatusNetworkReturn {
  information(100, 199),
  success(200, 299),
  redirection(300, 399),
  clientError(400, 499),
  serverError(500, 599);

  final int minValue;
  final int maxValue;

  const StatusNetworkReturn(
    this.minValue,
    this.maxValue,
  );
}
