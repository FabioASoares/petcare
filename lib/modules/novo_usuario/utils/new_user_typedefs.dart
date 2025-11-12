import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/modules/novo_usuario/datasource/model/user_model.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';

import '../../../core/helper/either.dart';

typedef FutureUserModel = Future<Either<UserModel, Failure>>;
typedef FutureUserEntity = Future<Either<UserEntity, Failure>>;
