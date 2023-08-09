import 'package:flutter/material.dart';
import 'package:ultra_market/config/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market/pages/sign/components/sign_up_tab.dart';

class TabTextField extends StatelessWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isPassword;
  final TextEditingController textController;
  const TabTextField(
      {Key? key,
      this.prefixIcon,
      this.suffixIcon,
      required this.isPassword,
      required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextField(
        controller: textController,
        onChanged: (value) {
          print(value);
        },
        keyboardType: TextInputType.visiblePassword,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.darkGreen,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 5.h),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
        ),
      ),
    );
  }
}
