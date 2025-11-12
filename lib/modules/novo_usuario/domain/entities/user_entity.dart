import 'package:map_fields/map_fields.dart';
import 'package:petcare/modules/novo_usuario/datasource/model/user_model.dart';

class UserEntity {
  final String email;
  final String dtNascimento;
  final String telefone;
  final String fotoPerfil;
  final String nacionalidade;
  final String userID;

  UserEntity({
    required this.email,
    required this.dtNascimento,
    required this.telefone,
    required this.fotoPerfil,
    required this.nacionalidade,
    required this.userID,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "dtNascimento": dtNascimento,
      "telefone": telefone,
      "fotoPerfil": fotoPerfil,
      "nacionalidade": nacionalidade,
      "userID": userID,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    final obj = MapFields.load(map);
    return UserEntity(
      email: obj.getString("email", ""),
      dtNascimento: obj.getString("dtNascimento", ""),
      telefone: obj.getString("telefone", ""),
      fotoPerfil: obj.getString("fotoPerfil", ""),
      nacionalidade: obj.getString("nacionalidade", ""),
      userID: obj.getString("userID", ""),
    );
  }

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      email: model.email,
      dtNascimento: model.dtNascimento,
      telefone: model.telefone,
      fotoPerfil: model.fotoPerfil,
      nacionalidade: model.nacionalidade,
      userID: model.userID,
    );
  }
}
