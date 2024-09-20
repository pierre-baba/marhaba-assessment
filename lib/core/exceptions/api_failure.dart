class ApiFailure implements Exception {
  dynamic error;
  dynamic stackTrace;

  ApiFailure({this.error, this.stackTrace});

  @override
  String toString() {
    return "Api Failure , $error";
  }
}
