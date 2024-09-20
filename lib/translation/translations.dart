// DO NOT EDIT. This is code translation via package:get_cli/get_cli.dart

// ignore_for_file: lines_longer_than_80_chars
// ignore: avoid_classes_with_only_static_members
import 'package:get/get.dart';

class AppTranslation extends Translations {
  static Map<String, Map<String, String>> translations = {
    'ar': Locales.ar,
    'en': Locales.en,
  };

  @override
  Map<String, Map<String, String>> get keys => translations;
}

class LocaleKeys {
  static const email = "email";

  static const somethingWentWrong = "something_went_wrong";

  static const unauthenticated = "unauthenticated";

  static const connectionError = "connection_error";

  static const checkYourInternetConnection = "check_your_internet_connection";

  static const passwordShouldBeMoreThan8Chars =
      "passwordShouldBeMoreThan8Chars";

  static const usersList = "users_lists";

  static const name = "name";

  static const register = "register";

  static const password = "password";

  static const validEmail = "valid_email";

  static const requiredField = "required_field";

  static const noUsersFound = "no_users_found";

  static const company = "company";

  static const validName = "valid_name";

  LocaleKeys._();
}

class Locales {
  static const en = {
    "valid_name": "Enter valid name",
    "company": "Company",
    "no_users_found": "No Users Found",
    "email": "Email",
    "something_went_wrong": "Something went wrong",
    "unauthenticated": "unauthenticated",
    "check_your_internet_connection": "Check your internet connection",
    "passwordShouldBeMoreThan8Chars": "Password should be 8 or more characters",
    "users_lists": "Users List",
    "name": "Name",
    "register": "Register",
    "password": "Password",
    "valid_email": "Enter valid email",
    "required_field": "Required Field",
    "connection_error": "Connection Error ",
  };

  static const ar = {
    "company": "الشركة",
    "no_users_found": "لا يوجد مستخدمين",
    "email": "الايميل",
    "something_went_wrong": "حدث خطأ ما",
    "unauthenticated": "unauthenticated",
    "check_your_internet_connection": "تحقق من اتصال الانترنت",
    "passwordShouldBeMoreThan8Chars":
        "يجب أن تتكون كلمة المرور من 8 أحرف أو أكثر",
    "users_lists": "قائمة المستخدمين",
    "name": "الاسم",
    "register": "التسجيل",
    "password": "كلمة المرور",
    "valid_email": "ادخل بريد الكتروني صالح",
    "required_field": "الحقل مطلوب",
    "valid_name": "ادخل اسم صالح",
    "connection_error": "خطأ في الاتصال",
  };
}
