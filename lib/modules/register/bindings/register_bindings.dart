import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/modules/register/controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
