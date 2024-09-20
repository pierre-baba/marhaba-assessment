import '../values/strings.dart';

class InternetConnectionError implements Exception {
  dynamic error;
  dynamic stackTrace;
  String message;
  String title;

  InternetConnectionError({this.error, this.stackTrace})
      : title = AppStrings.connectionError,
        message = AppStrings.checkYourInternetConnection;

  @override
  String toString() {
    return "$title\n$message";
  }
}
