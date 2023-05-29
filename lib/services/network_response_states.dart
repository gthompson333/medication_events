class NetworkResult<T> {
  NetworkResult._();
  factory NetworkResult.loading(T msg) = LoadingState<T>;
  factory NetworkResult.success(T value) = SuccessState<T>;
  factory NetworkResult.error(T msg) = ErrorState<T>;
}

class LoadingState<T> extends NetworkResult<T> {
  LoadingState(this.msg) : super._();
  final T msg;
}

class ErrorState<T> extends NetworkResult<T> {
  ErrorState(this.msg) : super._();
  final T msg;
}

class SuccessState<T> extends NetworkResult<T> {
  SuccessState(this.value) : super._();
  final T value;
}
