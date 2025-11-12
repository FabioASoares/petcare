import 'package:petcare/core/api/api_session.dart';
import 'package:petcare/core/utils/typedefs.dart';

import '../../../core/error/failure_generic_error.dart';
import '../../../core/helper/either.dart';
import '../../../services/response_custom.dart';
import '../../../services/sevices.dart';

abstract class NovoUsuarioService {
  FutureMap criarNovaConta(MapString usuario);
}

class NovoUsuarioServiceImpl implements NovoUsuarioService {
  final PostServices _postServices;

  NovoUsuarioServiceImpl(this._postServices);

  @override
  FutureMap criarNovaConta(MapString usuario) async {
    final url = UrlSession.instance.createNewUser;

    final response = await _postServices.postRequest(url, usuario);
    switch (response.statusNetworkType) {
      case StatusNetworkReturn.success:
        return Success(response.data);
      default:
        final mensagem = response.data;
        return Error(FailureGenericError(mensagem));
    }
  }
}
