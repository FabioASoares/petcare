import '../service/login_service.dart';

abstract class LoginDataSource {}

class LoginDataSourceImpl extends LoginDataSource {
  final LoginService _loginService;

  LoginDataSourceImpl(this._loginService);
}
