import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/utils/navigator.dart';
import 'package:marhaba_auctions_assessment/data/models/auth/login_body.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;

  RxMap<String, String> loginErrors = RxMap({});

  RegisterBody loginBody = RegisterBody();

  void register() {
    loginErrors(loginBody.validate(false).cast());
    if (loginErrors.isEmpty) {
      AppNavigator.offAllHome();
    }
  }
}
