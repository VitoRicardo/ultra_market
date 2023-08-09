import 'package:flutter/material.dart';
import 'package:ultra_market/config/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  const CategoryCard(
      {Key? key, required this.imagePath, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 80.w,
          decoration: BoxDecoration(
            color: AppColors.lightYellow,
            borderRadius: BorderRadius.circular(20.h),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          categoryName,
          style: TextStyle(
              color: AppColors.darkGreen, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
