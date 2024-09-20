abstract class ApiModel {}

abstract class ApiBody {
  Map<String, dynamic> toJson();

  Map<String, dynamic> validate(bool x);
}
