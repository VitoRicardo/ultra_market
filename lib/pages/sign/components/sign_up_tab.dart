import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market/config/app_colors.dart';
import 'package:ultra_market/cubits/sign_up/sign_up_cubit.dart';
import 'package:ultra_market/pages/widgets/long_rounded_button.dart';
import 'package:ultra_market/pages/widgets/text_tab_field.dart';
import '../../widgets/long_rounded_button.dart';

class SignUpTab extends StatelessWidget {
  const SignUpTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status == SignUpStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const Text('Email'),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return TabTextField(
                    isPassword: false,
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.darkGreen,
                    ),
                    onChanged: (email) =>
                        context.read<SignUpCubit>().emailChanged(email),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Password'),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return TabTextField(
                      isPassword: false,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.darkGreen,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: AppColors.darkGreen,
                      ),
                      onChanged: (password) => context
                          .read<SignUpCubit>()
                          .passwordChanged(password));
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Confirm Password'),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return TabTextField(
                    isPassword: false,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AppColors.darkGreen,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: AppColors.darkGreen,
                    ),
                    onChanged: (confirmPassword) => context
                        .read<SignUpCubit>()
                        .passwordConfirmChanged(confirmPassword),
                  );
                },
              ),
              SizedBox(
                height: 125.h,
              ),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return LongRoundedButton(
                    text: 'Sign Up',
                    onPressed: () =>
                        context.read<SignUpCubit>().signUpWithCredentials(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
