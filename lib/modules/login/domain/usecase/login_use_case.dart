import 'package:petcare/modules/login/utils/login_typedefs.dart';

import '../../repository/login_repository.dart';

abstract class LoginUseCase {
  FutureUserEntity logarPetCare(String userID);
}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _repository;

  LoginUseCaseImpl(this._repository);

  @override
  FutureUserEntity logarPetCare(String userID) {
    return _repository.logarPetCare(userID);
  }
}
