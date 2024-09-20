import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/utils/locale_edge_insets.dart';
import 'package:marhaba_auctions_assessment/core/values/colors.dart';
import 'package:marhaba_auctions_assessment/core/values/strings.dart';
import 'package:marhaba_auctions_assessment/core/values/text_styles.dart';

class BackTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool autoImplyLeading;
  final Widget? action;
  final Widget? action2;
  final double titleSpacing;
  final TextStyle? textStyle;
  final VoidCallback? backCallback;
  final PreferredSizeWidget? bottom;
  final VoidCallback? titleCallback;
  final Color? bgColor;

  const BackTitleAppBar({
    Key? key,
    this.bgColor,
    this.titleCallback,
    this.bottom,
    this.backCallback,
    this.textStyle,
    this.titleSpacing = 0,
    this.action,
    this.action2,
    required this.title,
    this.autoImplyLeading = true,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: autoImplyLeading,
      title: GestureDetector(
        onTap: titleCallback,
        child: Container(
          padding: LocaleEdgeInsets.only(start: autoImplyLeading ? 0 : 20.w),
          child: Text(
            title,
          ),
        ),
      ),
      bottom: bottom,
      titleSpacing: titleSpacing,
      centerTitle: centerTitle,
      elevation: 0,
      leadingWidth: 50.w,
      toolbarHeight: Get.height * (bottom == null ? 0.09 : 0.125),
      leading: autoImplyLeading
          ? InkWell(
              onTap: () {
                Navigator.of(context).pop();
                if (backCallback != null) {
                  backCallback!();
                }
              },
              splashColor: AppColors.lightPrimary.withOpacity(0.3),
              highlightColor: Colors.transparent,
              child: Container(
                padding: LocaleEdgeInsets.only(end: 20.w),
                color: Colors.transparent,
                alignment: Get.locale!.languageCode == 'en'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: SvgPicture.asset(
                  AssetsPaths.icArrowBack,
                  color: bgColor ?? Colors.black,
                  width: 10.w,
                  height: 20.h,
                ),
              ),
            )
          : null,
      actions: [if (action != null) action!, if (action2 != null) action2!],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(Get.height * (bottom == null ? 0.09 : 0.125));
}
