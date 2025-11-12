import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/login/utils/login_typedefs.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';

import '../datasource/login_datasource.dart';

abstract class LoginRepository {
  FutureUserEntity logarPetCare(String userID);
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _remote;

  LoginRepositoryImpl(this._remote);

  @override
  FutureUserEntity logarPetCare(String userID) async {
    final response = await _remote.logarPetCare(userID);

    return response.fold(
      (success) => Success(UserEntity.fromModel(success)),
      (error) => Error(FailureGenericError(error.message)),
    );
  }
}
