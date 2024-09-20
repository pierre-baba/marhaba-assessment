import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/base/api.dart';
import 'package:marhaba_auctions_assessment/core/values/strings.dart';

class RegisterBody extends ApiBody {
  String? name;
  String? email;
  String? password;

  RegisterBody({this.email, this.password, this.name});

  @override
  Map<String, dynamic> toJson() {
    return {"email": email, "password": password, "name": name};
  }

  @override
  Map<String, dynamic> validate(bool x) {
    Map<String, dynamic> errors = {};

    if (name?.isEmpty ?? true) {
      errors["name"] = AppStrings.requiredField;
    }
    if (name != null &&
        !RegExp(r"^[A-Za-z\u0621-\u064A]+(?:[-' ]?[A-Za-z\u0621-\u064A]+)*$")
            .hasMatch(name!)) {
      errors["name"] = AppStrings.validName;
    }
    if (email?.isEmpty ?? true) {
      errors["email"] = AppStrings.requiredField;
    }
    if (email != null && !GetUtils.isEmail(email!)) {
      errors["email"] = AppStrings.validEmail;
    }
    if (password?.isEmpty ?? true) {
      errors["password"] = AppStrings.requiredField;
    }
    if (password != null && password!.length < 8) {
      errors["password"] = AppStrings.passwordShouldBeMoreThan8Chars;
    }
    return errors;
  }
}
