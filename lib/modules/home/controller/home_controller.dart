import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/utils/request_utils.dart';
import 'package:marhaba_auctions_assessment/data/providers/api_provider.dart';

import '../../../data/models/home/user_model.dart';

class HomeController extends GetxController {
  List<UserModel> users = [];
  RxBool isLoading = false.obs;
  RxBool error = false.obs;
  RxString errorMessage = "".obs;

  @override
  void onInit() async {
    super.onInit();
    getUsersList();
  }

  Future<void> getUsersList() async {
    await RequestUtils.handle(
        request: () async {
          users = await Get.find<ApiRequests>().getUsersList();
        },
        errorMessage: errorMessage,
        errorOccurred: error,
        showErrorSnackBar: false,
        showFailureSnackBar: false,
        loaders: [isLoading]);
  }
}
