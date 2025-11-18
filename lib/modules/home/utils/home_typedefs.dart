import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/formulario_pet/datasource/model/formulario_cadastro_pet.dart';
import 'package:petcare/modules/formulario_pet/domain/entities/formulario_pet_entity.dart';

typedef FutureListPetModel = Future<Either<List<FormularioPetModel>, Failure>>;
typedef FutureListPetEntity
    = Future<Either<List<FormularioPetEntity>, Failure>>;
