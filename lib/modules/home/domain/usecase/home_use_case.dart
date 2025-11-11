import '../../repository/home_repository.dart';

abstract class HomeUseCase {}

class HomeUseCaseImpl implements HomeUseCase {
  final HomeRepository _homeRepository;

  HomeUseCaseImpl(this._homeRepository);
}
