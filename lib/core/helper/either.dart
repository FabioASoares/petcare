abstract class Either<S, E> {
  const Either();

  T fold<T>(
    T Function(S success) success,
    T Function(E error) error,
  ) {
    if (this is Error) {
      return error((this as Error).value);
    } else {
      return success((this as Success).value);
    }
  }
}

class Success<S, E> extends Either<S, E> {
  final S _r;
  const Success(this._r);
  S get value => _r;
}

class Error<S, E> extends Either<S, E> {
  final E _l;
  const Error(this._l);
  E get value => _l;
}
