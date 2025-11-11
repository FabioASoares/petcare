import 'petcenter_injection.dart';

class PetCenterModule {
  final PetCenterInjection _injection = PetCenterInjection();
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
