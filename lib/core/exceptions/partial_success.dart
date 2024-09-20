import 'package:get/get.dart';

class PartialSuccess implements Exception{
  String message;
  Response response;

  PartialSuccess({required this.message, required this.response});

  @override
  String toString() {
    return "PartialSuccess $message";
  }
}
