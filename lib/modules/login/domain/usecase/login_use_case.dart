import '../../repository/login_repository.dart';

abstract class LoginUseCase {}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCaseImpl(this._loginRepository);
}
