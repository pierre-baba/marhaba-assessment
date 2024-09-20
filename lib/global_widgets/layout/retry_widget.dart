import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marhaba_auctions_assessment/core/values/strings.dart';

class RetryWidget extends StatelessWidget {
  final VoidCallback retryCallback;
  final String? message;

  const RetryWidget({
    Key? key,
    required this.retryCallback,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: retryCallback,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message ?? AppStrings.somethingWentWrong,
              // style: TextStyles.paragraphMediumBoldTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            const Icon(
              Icons.refresh,
            )
          ],
        ),
      ),
    );
  }
}
