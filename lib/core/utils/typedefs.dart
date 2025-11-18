import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';

typedef FutureMap = Future<Either<Map<String, dynamic>, Failure>>;
typedef FutureListMap = Future<Either<List<Map<String, dynamic>>, Failure>>;
typedef MapString = Map<String, dynamic>;
