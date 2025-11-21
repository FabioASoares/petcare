import 'package:petcare/core/api/api_session.dart';
import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/core/utils/typedefs.dart';
import 'package:petcare/services/response_custom.dart';
import 'package:petcare/services/sevices.dart';

abstract class PetsService {
  FutureListMap getListPets(String idUsuario);
}

class PetsServiceImpl implements PetsService {
  final GetServices _get;
  PetsServiceImpl(this._get);
  @override
  FutureListMap getListPets(String idUsuario) async {
    final url = "${UrlSession.instance.animal}?idTutor=$idUsuario";

    final response = await _get.getRequest(url, {});

    switch (response.statusNetworkType) {
      case StatusNetworkReturn.success:
        final list = response.data as List;

        return Success(list.cast<Map<String, dynamic>>());
      default:
        final mensagem = response.data;
        if (mensagem == 'Not found') {
          return Error(FailureGenericError("Nenhum Pet cadastrado"));
        }
        return Error(
          FailureGenericError(
            "Servidor indisponível no momento, tente novamente mais tarde.",
          ),
        );
    }
  }
}
