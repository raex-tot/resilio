sealed class Result<T> {
  const Result();

  R when<R>({required R Function(T) success, required R Function(Object) failure}) {
    if (this is Success<T>) return success((this as Success<T>).value);
    return failure((this as Failure<T>).error);
  }
}

class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;
}

class Failure<T> extends Result<T> {
  const Failure(this.error);
  final Object error;
}
