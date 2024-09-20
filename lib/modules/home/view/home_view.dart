import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/utils/default_settings.dart';
import 'package:marhaba_auctions_assessment/core/utils/loader.dart';
import 'package:marhaba_auctions_assessment/core/values/strings.dart';
import 'package:marhaba_auctions_assessment/global_widgets/bars/back_title_app_bar.dart';
import 'package:marhaba_auctions_assessment/global_widgets/layout/retry_widget.dart';
import 'package:marhaba_auctions_assessment/modules/home/view/widgets/user_item_widget.dart';

import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: BackTitleAppBar(
            title: AppStrings.usersList,
            autoImplyLeading: false,
            action: IconButton(
              onPressed: () {
                DefaultSettings.setTheme();
              },
              icon: GetBuilder<HomeController>(builder: (c) {
                return Icon(
                  (DefaultSettings.theme) ? Icons.light_mode : Icons.dark_mode,
                  // color: Colors.white,
                );
              }),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              controller.getUsersList();
            },
            child: controller.isLoading.value
                ? const Center(child: DefaultLoader())
                : controller.error.value
                    ? RetryWidget(
                        retryCallback: () {
                          controller.getUsersList();
                        },
                        message: controller.errorMessage.value,
                      )
                    : controller.users.isEmpty
                        ? Text(AppStrings.noUsersFound)
                        : ListView.builder(
                            itemBuilder: (c, i) {
                              return UserCard(userData: controller.users[i]);
                            },
                            itemCount: controller.users.length),
          ));
    });
  }
}
