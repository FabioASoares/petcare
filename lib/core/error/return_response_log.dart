import 'package:map_fields/map_fields.dart';

class ReturnResponseLog {
  final int codigoErro;
  final String mensagem;

  ReturnResponseLog({
    required this.codigoErro,
    required this.mensagem,
  });

  factory ReturnResponseLog.fromMap(Map<String, dynamic> maps) {
    final map = MapFields.load(maps);
    return ReturnResponseLog(
      codigoErro: map.getInt("codigoErro", 0),
      mensagem: map.getString("mensagem", ""),
    );
  }
}
