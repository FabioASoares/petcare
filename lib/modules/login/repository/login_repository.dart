import '../datasource/login_datasource.dart';

abstract class LoginRepository {
 
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _dataSource;

  LoginRepositoryImpl(this._dataSource);

}
