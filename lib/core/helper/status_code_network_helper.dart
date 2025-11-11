import '../../services/response_custom.dart';

StatusNetworkReturn getStatusCodeNetworkType(int? statusCode) {
  if (statusCode == null) {
    return StatusNetworkReturn.information;
  } else if (statusCode >= 100 && statusCode <= 199) {
    return StatusNetworkReturn.information;
  } else if (statusCode >= 200 && statusCode <= 299) {
    return StatusNetworkReturn.success;
  } else if (statusCode >= 300 && statusCode <= 399) {
    return StatusNetworkReturn.redirection;
  } else if (statusCode >= 400 && statusCode <= 499) {
    return StatusNetworkReturn.clientError;
  } else if (statusCode >= 500 && statusCode <= 599) {
    return StatusNetworkReturn.serverError;
  } else {
    return StatusNetworkReturn.information;
  }
}
