import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DefaultLoader extends StatelessWidget {
  final bool threeDots;

  // final Color? color;
  final int androidSize;
  final int iosSize;

  const DefaultLoader(
      {Key? key,
      this.iosSize = 20,
      this.androidSize = 50,
      // this.color = AppColors.lightBlack,
      this.threeDots = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return threeDots
        ? SpinKitThreeInOut(
            // color: color,
            size: 30.h,
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoActivityIndicator(
              radius: iosSize.h,
              // color: color!,
            ),
          );
  }
}
