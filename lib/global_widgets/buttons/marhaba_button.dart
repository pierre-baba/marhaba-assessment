import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/utils/loader.dart';
import 'package:marhaba_auctions_assessment/core/values/colors.dart';
import 'package:marhaba_auctions_assessment/core/values/fonts.dart';
import 'package:marhaba_auctions_assessment/core/values/strings.dart';

class MarhabaButton extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final Color? textColor;
  final TextStyle? textStyle;
  final int borderRadius;
  final Color? backgroundColor;
  final double? width;
  final Gradient? gradient;
  final bool isExpanded;
  final Color? borderColor;
  final bool isLoading;
  final double? height;
  final bool isDisabled;

  final Color? shadowColor;
  final bool withShadow;
  final String? leftIcon;
  final String? rightIcon;

  const MarhabaButton(
      {Key? key,
      this.leftIcon,
      this.rightIcon,
      this.shadowColor,
      this.height,
      this.isDisabled = false,
      this.isLoading = false,
      this.gradient,
      required this.callback,
      required this.title,
      this.isExpanded = true,
      this.width,
      this.backgroundColor = AppColors.lightPrimary,
      this.borderRadius = 12,
      this.borderColor,
      this.textColor,
      this.textStyle,
      this.withShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // isLoading
        //   ? const DefaultLoader()
        //   :
        Row(
      children: [
        Expanded(
          flex: isExpanded ? 1 : 0,
          child: Container(
            width: width ?? Get.width,
            height: height ?? 48.h,
            decoration: BoxDecoration(
                color: isLoading || isDisabled
                    ? AppColors.lightGrey
                    : backgroundColor,
                borderRadius: BorderRadius.circular(
                  borderRadius.r,
                ),
                boxShadow: withShadow && !isDisabled
                    ? [
                        BoxShadow(
                          color: shadowColor?.withOpacity(0.4) ??
                              AppColors.lightGrey.withOpacity(0.4),
                          offset: const Offset(0, 10),
                          blurRadius: 15,
                        ),
                        BoxShadow(
                          color: AppColors.lightBackground.withOpacity(0.05),
                          offset: const Offset(0, 4),
                          blurRadius: 6,
                        ),
                      ]
                    : [],
                border: borderColor != null
                    ? Border.all(color: borderColor!, width: 2.w)
                    : null),
            child: isLoading
                ? SizedBox(
                    height: 20.h,
                    child: const FittedBox(child: DefaultLoader()),
                  )
                : ElevatedButton(
                    onPressed: isDisabled ? () {} : callback,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor:
                          AppColors.lightBackground.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          borderRadius.r,
                        ),
                      ),
                      elevation: 0,
                    ),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (leftIcon != null) SvgPicture.asset(leftIcon!),
                          if (leftIcon != null) SizedBox(width: 12.h),
                          Text(
                            title,
                            style: textStyle ??
                                TextStyle(
                                    color: AppColors.lightBackground,
                                    fontFamily: AppFonts.inter,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                            textAlign: TextAlign.center,
                          ),
                          if (rightIcon != null) SizedBox(width: 12.h),
                          if (rightIcon != null)
                            SvgPicture.asset(AssetsPaths.icArrowRight)
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
