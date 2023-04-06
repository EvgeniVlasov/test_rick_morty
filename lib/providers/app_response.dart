class AppResponse<T, E> {
  final T? data;
  final E? error;
  final int? errorCode;
  final AppResponseStatus _status;

  AppResponse.success({
    this.data,
  })  : _status = AppResponseStatus.success,
        error = null,
        errorCode = null;

  AppResponse.error({
    this.errorCode,
    this.error,
  })  : data = null,
        _status = AppResponseStatus.error;

  bool get isSuccess => _status == AppResponseStatus.success;

  bool get isError => _status == AppResponseStatus.error;
}

enum AppResponseStatus {
  success,
  error;
}
