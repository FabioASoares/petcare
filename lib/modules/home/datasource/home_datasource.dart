import '../service/home_service.dart';

abstract class HomeDataSource {}

class HomeDataSourceImpl extends HomeDataSource {
  final HomeService _homeService;

  HomeDataSourceImpl(this._homeService);
}
