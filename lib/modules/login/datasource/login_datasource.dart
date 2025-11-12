import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/login/utils/login_typedefs.dart';
import 'package:petcare/modules/novo_usuario/datasource/model/user_model.dart';

import '../service/login_service.dart';

abstract class LoginRemoteDataSource {
  FutureUserModel logarPetCare(String userID);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final LoginService _service;

  LoginRemoteDataSourceImpl(this._service);

  @override
  FutureUserModel logarPetCare(String userID) async {
    final response = await _service.logarPetCare(userID);

    return response.fold(
      (success) => Success(UserModel.fromMap(success)),
      (error) => Error(FailureGenericError(error.message)),
    );
  }
}
