abstract class Failure implements Exception {
  String message = "Não foi possível processar as informações";
}

class FailureGenericError implements Failure {
  @override
  String message;

  FailureGenericError(this.message);
}

class UnprocessableFailure implements Failure {
  @override
  String message;

  UnprocessableFailure(this.message);
}

class FailureCastModel extends FailureGenericError {
  FailureCastModel(super.message);
}
