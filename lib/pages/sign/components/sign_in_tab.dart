import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market/config/app_colors.dart';
import 'package:ultra_market/cubits/sign_in/sign_in_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:ultra_market/pages/widgets/long_rounded_button.dart';
import 'package:ultra_market/pages/widgets/text_tab_field.dart';
import 'package:ultra_market/repositories/auth/auth_repository.dart';

class SignInTab extends StatefulWidget {
  const SignInTab({Key? key}) : super(key: key);

  @override
  State<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status == SignInStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
        if (state.status == SignInStatus.success) {
          print(context.read<AuthRepository>().currentUser);
          context.go('/market');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const Text('Email'),
                BlocBuilder<SignInCubit, SignInState>(
                  builder: (context, state) {
                    return TabTextField(
                      isPassword: false,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.darkGreen,
                      ),
                      onChanged: (email) =>
                          context.read<SignInCubit>().emailChanged(email),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text('Password'),
                BlocBuilder<SignInCubit, SignInState>(
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
                      onChanged: (password) =>
                          context.read<SignInCubit>().passwordChanged(password),
                    );
                  },
                ),
                SizedBox(
                  height: 220.h,
                ),
                BlocBuilder<SignInCubit, SignInState>(
                  builder: (context, state) {
                    return LongRoundedButton(
                      suffixChild:
                          (Image.asset('assets/images/google_logo.png')),
                      text: 'Sign In With',
                      onPressed: () {
                        context.read<SignInCubit>().signInWithGoogle();
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<SignInCubit, SignInState>(
                  builder: (context, state) {
                    return LongRoundedButton(
                      text: 'Sign In',
                      onPressed: () {
                        context.read<SignInCubit>().signInWithCredentials();
                        // context.go('/market');
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
