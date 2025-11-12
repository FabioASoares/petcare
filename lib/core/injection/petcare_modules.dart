import 'petcare_module.dart';

class PetCareModules {
  static final Map<String, PetCareModule> _modules = {};

  static PetCareModule createModule(String name) {
    final module = PetCareModule();
    _modules[name] = module;
    return module;
  }

  static void disposeModule(String name) {
    _modules[name]?.dispose();
    _modules.remove(name);
  }

  static PetCareModule getModule(String name) {
    return _modules[name]!;
  }
}
