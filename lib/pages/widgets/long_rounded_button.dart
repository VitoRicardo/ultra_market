import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market/config/app_colors.dart';

class LongRoundedButton extends StatelessWidget {
  final String text;
  final Widget? suffixChild;
  final VoidCallback onPressed;
  const LongRoundedButton(
      {Key? key, required this.text, required this.onPressed, this.suffixChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(25.h),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: suffixChild == null
              ? Text(
                  text,
                  style: TextStyle(
                      color: AppColors.darkGreen, fontWeight: FontWeight.bold),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    suffixChild!
                  ],
                ),
        ),
      ),
    );
  }
}
