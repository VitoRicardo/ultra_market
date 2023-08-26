import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ultra_market/config/app_colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
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
                      child: Image.asset('assets/images/delivery_person.png'),
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
                Container(
                  child: Text(
                    'Welcome to UltraMarket, where innovation meets convenience.',
                    style: TextStyle(
                      color: AppColors.darkGreen.withOpacity(0.5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(25.h),
                  ),
                  child: TextButton(
                    onPressed: () => context.go('/sign'),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                                color: AppColors.darkGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: AppColors.darkGreen,
                            size: 15.h,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
