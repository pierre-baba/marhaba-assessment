import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/values/strings.dart';
import 'package:marhaba_auctions_assessment/global_widgets/buttons/marhaba_button.dart';
import 'package:marhaba_auctions_assessment/global_widgets/fields/text_form_field.dart';
import 'package:marhaba_auctions_assessment/modules/register/controller/register_controller.dart';

import '../../../core/values/text_styles.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        height: Get.height,
        width: Get.width,
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 109.h),
              Center(
                child: Text(
                  AppStrings.register,
                  style: TextStyles.h1TextStyle,
                ),
              ),
              SizedBox(height: 50.h),
              ASAPTextFormField(
                hintText: AppStrings.name,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onChanged: (s) {
                  controller.loginBody.name = s;
                },
                error: controller.loginErrors["name"],
              ),
              SizedBox(height: 20.h),
              ASAPTextFormField(
                hintText: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (s) {
                  controller.loginBody.email = s;
                },
                error: controller.loginErrors["email"],
              ),
              SizedBox(height: 20.h),
              ASAPTextFormField(
                obscureText: true,
                hintText: AppStrings.password,
                onChanged: (s) {
                  controller.loginBody.password = s;
                },
                error: controller.loginErrors["password"],
              ),
              const Spacer(),
              MarhabaButton(
                  callback: () {
                    controller.register();
                  },
                  isLoading: controller.isLoading.value,
                  title: AppStrings.register),
              SizedBox(height: 180.h),
            ],
          );
        }),
      ),
    ));
  }
}
