import 'package:map_fields/map_fields.dart';

class UserModel {
  final String email;
  final String dtNascimento;
  final String telefone;
  final String fotoPerfil;
  final String nacionalidade;
  final String userID;
  final String nomeUsuario;

  UserModel({
    required this.email,
    required this.dtNascimento,
    required this.telefone,
    required this.fotoPerfil,
    required this.nacionalidade,
    required this.userID,
    required this.nomeUsuario,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "dtNascimento": dtNascimento,
      "telefone": telefone,
      "fotoPerfil": fotoPerfil,
      "nacionalidade": nacionalidade,
      "userID": userID,
      "nomeUsuario": nomeUsuario,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final obj = MapFields.load(map);
    return UserModel(
      email: obj.getString("email", ""),
      dtNascimento: obj.getString("dtNascimento", ""),
      telefone: obj.getString("telefone", ""),
      fotoPerfil: obj.getString("fotoPerfil", ""),
      nacionalidade: obj.getString("nacionalidade", ""),
      userID: obj.getString("userID", ""),
      nomeUsuario: obj.getString("nomeUsuario", ""),
    );
  }
}
