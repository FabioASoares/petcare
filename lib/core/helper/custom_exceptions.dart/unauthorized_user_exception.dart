import 'package:petcare/core/error/failure_generic_error.dart';

class UnauthorizedUserException implements FailureGenericError {
  @override
  String message =
      "Você não está autorizado a utilizar os serviços do aplicativo SGZ Notifica.";

  Exception handleLoginException() {
    return Exception(message);
  }
}

class InactivatedUserException implements FailureGenericError {
  @override
  String message = "Este usuário está inativado.";

  Exception handleLoginException() {
    return Exception(message);
  }
}

class ConnectionErrorException implements FailureGenericError {
  ConnectionErrorException();

  @override
  String message = "Sem conexão. Tente novamente mais tarde.";

  Exception handleLoginException() {
    return Exception(message);
  }
}
