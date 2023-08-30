import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultra_market/config/app_colors.dart';
import 'package:ultra_market/cubits/sign_in/sign_in_cubit.dart';
import 'package:ultra_market/pages/widgets/long_rounded_button.dart';

import '../../repositories/auth/auth_repository.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
          context.go('/market');
          print(context.read<AuthRepository>().currentUser);
          // context.go('/market');
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 345.w,
                          height: 345.h,
                          child:
                              Image.asset('assets/images/delivery_person.png'),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      child: Text(
                        'SuperMarket At Next Level',
                        style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Welcome to UltraMarket, where innovation meets convenience.',
                      style: TextStyle(
                        color: AppColors.darkGreen.withOpacity(0.5),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    LongRoundedButton(
                      text: 'Get Started',
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        if (prefs.getStringList('AutoAuth')?[0] == 'Google' &&
                            context.mounted) {
                          context.read<SignInCubit>().signInWithGoogle();
                        } else if (prefs.getStringList('AutoAuth')?[0] ==
                                'EmailPassword' &&
                            context.mounted) {
                          context.read<SignInCubit>().emailChanged(
                              prefs.getStringList('AutoAuth')![1]);
                          context.read<SignInCubit>().passwordChanged(
                              prefs.getStringList('AutoAuth')![2]);
                          context.read<SignInCubit>().signInWithCredentials();
                        } else {
                          context.go('/sign');
                        }
                      },
                      suffixChild: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AppColors.darkGreen,
                        size: 15.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
