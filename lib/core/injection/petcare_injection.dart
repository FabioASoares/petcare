class PetCareInjection {
  final Map<Type, dynamic> _instances = {};
  final Map<Type, dynamic> _factories = {};

  void dispose() {
    _instances.clear();
    _factories.clear();
  }

  void register<T>(T value) {
    _instances[T] = value;
  }

  void registerFactory<T>(T Function() value) {
    _factories[T] = value;
  }

  T get<T>() {
    if (_instances.containsKey(T)) {
      return _instances[T];
    }
    if (_factories.containsKey(T)) {
      return _factories[T]();
    }
    throw Exception('Type $T not found');
  }
}
