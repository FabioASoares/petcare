import 'petcare_injection.dart';

class PetCareModule {
  final PetCareInjection _injection = PetCareInjection();
  void dispose() => _injection.dispose();
  void register<T>(T value) {
    _injection.register<T>(value);
  }

  void registerFactory<T>(T Function() value) {
    _injection.registerFactory<T>(value);
  }

  T get<T>() {
    return _injection.get<T>();
  }
}
