import 'package:petcare/core/api/api_session.dart';
import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/core/utils/typedefs.dart';
import 'package:petcare/services/response_custom.dart';
import 'package:petcare/services/sevices.dart';

abstract class LoginService {
  FutureMap logarPetCare(String idUsuario);
}

class LoginServiceImpl implements LoginService {
  final GetServices _getServices;

  LoginServiceImpl(this._getServices);
  @override
  FutureMap logarPetCare(String idUsuario) async {
    final url = "${UrlSession.instance.login}?userID=$idUsuario";

    final response = await _getServices.getRequest(url, {});

    switch (response.statusNetworkType) {
      case StatusNetworkReturn.success:
        if (response.data is List && (response.data as List).isNotEmpty) {
          return Success((response.data as List).first);
        } else {
          return Error(FailureGenericError("Usuário não encontrado"));
        }
      default:
        final mensagem = response.data;
        if (mensagem == 'Not found') {
          return Error(FailureGenericError("Usuário ou senha inválidos"));
        }
        return Error(FailureGenericError(
          "Servidor indisponível no momento, tente novamente mais tarde.",
        ));
    }
  }
}
