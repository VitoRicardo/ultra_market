import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market/config/app_colors.dart';
import 'text_tab_field.dart';
import 'sign_button.dart';

class SignInTab extends StatefulWidget {
  const SignInTab({Key? key}) : super(key: key);

  @override
  State<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  bool isCheck = false;
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 30.h,
                    child: Image.asset('assets/images/google_logo.png'),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Image.asset('assets/images/apple_logo.png'),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Image.asset('assets/images/facebook_logo.png'),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                'Or use your email account to Sign In',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text('Email'),
            TabTextField(
              textController: _emailController,
              isPassword: false,
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.darkGreen,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text('Password'),
            TabTextField(
              textController: _passwordController,
              isPassword: false,
              prefixIcon: Icon(
                Icons.lock,
                color: AppColors.darkGreen,
              ),
              suffixIcon: Icon(
                Icons.visibility_off,
                color: AppColors.darkGreen,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Remember me',
                  style: TextStyle(color: AppColors.darkGreen),
                ),
                Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.lightGreen),
                  activeColor: AppColors.lightGreen,
                  checkColor: AppColors.darkGreen,
                  splashRadius: 0,
                  value: isCheck,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheck = value!;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 162.h,
            ),
            SignButton(
              text: 'Sign In',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
