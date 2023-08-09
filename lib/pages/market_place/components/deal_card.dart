import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market/config/app_colors.dart';

class DealCard extends StatelessWidget {
  final String headDealText;
  final String coreDealText;
  final Image image;
  final VoidCallback onPressed;

  const DealCard({
    Key? key,
    required this.headDealText,
    required this.coreDealText,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightYellow,
        borderRadius: BorderRadius.circular(25.h),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h, top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headDealText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: AppColors.darkGreen.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  height: 45.h,
                  width: 125.w,
                  child: Text(
                    coreDealText,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: AppColors.darkGreen),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: AppColors.darkGreen,
                      borderRadius: BorderRadius.circular(20.h),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: onPressed,
                      child: Center(
                        child: Text(
                          'Shop Now',
                          style: TextStyle(
                            color: AppColors.lightGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(width: 95.w, child: image)
          ],
        ),
      ),
    );
  }
}
