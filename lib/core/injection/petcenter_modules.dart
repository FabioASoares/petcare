import 'petcenter_module.dart';

class PetCenterModules {
  static final Map<String, PetCenterModule> _modules = {};

  static PetCenterModule createModule(String name) {
    final module = PetCenterModule();
    _modules[name] = module;
    return module;
  }

  static void disposeModule(String name) {
    _modules[name]?.dispose();
    _modules.remove(name);
  }

  static PetCenterModule getModule(String name) {
    return _modules[name]!;
  }
}
