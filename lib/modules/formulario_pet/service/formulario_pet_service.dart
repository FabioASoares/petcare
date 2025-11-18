import 'package:petcare/core/api/api_session.dart';
import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/core/utils/typedefs.dart';
import 'package:petcare/services/response_custom.dart';
import 'package:petcare/services/sevices.dart';

abstract class FormularioPetService {
  FutureMap cadastrarPet(MapString dadosPet);
}

class FormularioPetServiceImpl implements FormularioPetService {
  final PostServices _post;
  FormularioPetServiceImpl(this._post);
  @override
  FutureMap cadastrarPet(MapString dadosPet) async {
    final url = UrlSession.instance.animal;

    final response = await _post.postRequest(url, dadosPet);
    switch (response.statusNetworkType) {
      case StatusNetworkReturn.success:
        return Success(response.data);
      default:
        final mensagem = response.data;
        return Error(FailureGenericError(mensagem));
    }
  }
}
