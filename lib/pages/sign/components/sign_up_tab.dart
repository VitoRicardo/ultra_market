import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market/blocs/auth/auth_bloc.dart';
import 'package:ultra_market/config/app_colors.dart';
import 'text_tab_field.dart';
import 'sign_button.dart';

class SignUpTab extends StatelessWidget {
  const SignUpTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text controllers
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
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
            const Text('Full Name'),
            TabTextField(
              textController: nameController,
              isPassword: false,
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.darkGreen,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text('Email'),
            TabTextField(
              textController: emailController,
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
              textController: passwordController,
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
            SizedBox(
              height: 20.h,
            ),
            const Text('Confirm Password'),
            TabTextField(
              textController: confirmPasswordController,
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
            SizedBox(
              height: 30.h,
            ),
            SignButton(
              text: 'Sign Up',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
