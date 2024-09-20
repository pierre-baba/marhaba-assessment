class SimpleResponse {
  String? message;

  SimpleResponse({required this.message});

  factory SimpleResponse.fromJson(Map<String, dynamic> json) {
    return SimpleResponse(message: json["message"]);
  }
}
