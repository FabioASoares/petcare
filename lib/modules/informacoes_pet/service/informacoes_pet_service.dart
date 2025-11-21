import 'package:petcare/core/utils/typedefs.dart';
import 'package:petcare/services/sevices.dart';

abstract class InformacoesPetService {
  FutureListMap getListPets(String idUsuario);
}

class InformacoesPetServiceImpl implements InformacoesPetService {
  final GetServices _get;
  InformacoesPetServiceImpl(this._get);

  @override
  FutureListMap getListPets(String idUsuario) {
    // TODO: implement getListPets
    throw UnimplementedError();
  }
}
