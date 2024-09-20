class ErrorModel {}

class MultiErrorModel extends ErrorModel {
  String? message;
  Map<String, String>? errors;
  int? code;
  String? statusText;

  MultiErrorModel(
    this.code,
    this.statusText, {
    this.message,
    this.errors,
  });

  MultiErrorModel.fromJson(
    Map<String, dynamic> json, {
    this.code,
    this.statusText,
  }) {
    Map<String, String> decodedData = {};

    try {
      if (json.containsKey('errors')) {
        Map<String, dynamic> dataMap = json['errors'];
        dataMap.forEach((key, value) {
          if (value is List && value.isNotEmpty) {
            decodedData[key] = value[0];
          }
        });
        print(decodedData);
      } else {
        print('The "data" field is not present in the JSON response.');
      }
    } catch (e) {}

    message =
        json['message'] ?? json['error'] ?? json['name'] ?? json['not_found'];
    errors =
        decodedData.isNotEmpty ? decodedData : Map.from(json['errors'] ?? {});
  }

  factory MultiErrorModel.fromValidator(
    Map<String, dynamic> json, {
    int? code,
    String? statusText,
  }) =>
      MultiErrorModel.fromJson({"errors": json},
          code: code, statusText: statusText);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors!;
    }
    return data;
  }
}
