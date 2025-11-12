enum UrlSessionType {
  homologacao,
}

enum BaseUrlSessionType {
  base("https://69126d6252a60f10c821a355.mockapi.io/petcenter/api/v1/");

  final String baseUrl;
  const BaseUrlSessionType(
    this.baseUrl,
  );
}

class AmbienteUrlConfig {
  final String login;
  final String createNewUser;
  final String animal;

  const AmbienteUrlConfig({
    required this.login,
    required this.createNewUser,
    required this.animal,
  });
}

class BaseUrlSession {
  static const UrlSessionType ambiente = UrlSessionType.homologacao;
  static final Map<UrlSessionType, AmbienteUrlConfig> _configs = {
    UrlSessionType.homologacao: AmbienteUrlConfig(
      login: "${BaseUrlSessionType.base.baseUrl}login",
      createNewUser: "${BaseUrlSessionType.base.baseUrl}login",
      animal: "${BaseUrlSessionType.base.baseUrl}animal",
    ),
  };

  static AmbienteUrlConfig get config => _configs[ambiente]!;
}

class UrlSession {
  UrlSession._();
  static final instance = UrlSession._();

  final AmbienteUrlConfig _config = BaseUrlSession.config;

  String get login => _config.login;
  String get createNewUser => _config.createNewUser;
  String get animal => _config.animal;
}
