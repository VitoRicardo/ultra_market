import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_market/config/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'components/deal_card.dart';
import 'components/tab_deal.dart';
import 'components/category_card.dart';
import 'package:ultra_market/dummy_shop_category.dart';

class MarketPlacePage extends StatelessWidget {
  const MarketPlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery',
                style: TextStyle(
                    color: AppColors.darkGreen,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    'Bacagan, Sambit',
                    style: TextStyle(
                        color: AppColors.darkGreen.withOpacity(0.4),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.darkGreen,
                  )
                ],
              )
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CircleAvatar(
                backgroundColor: AppColors.darkGreen,
                child: Icon(
                  Icons.person,
                  color: AppColors.lightGreen,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                height: 50.h,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.h),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TabDeals(
              tabDealsWidgets: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: DealCard(
                    headDealText: 'Top deal !',
                    coreDealText: 'FRESH AVOCADO UP TO 15% OFF',
                    image: Image.asset('assets/images/categories/avocado.png'),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: DealCard(
                    headDealText: 'Category Deal !',
                    coreDealText: 'succulent meat up to 30% off'.toUpperCase(),
                    image: Image.asset('assets/images/categories/meat.png'),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: DealCard(
                    headDealText: 'Category Deal !',
                    coreDealText: 'delicious fruits 20% off'.toUpperCase(),
                    image: Image.asset('assets/images/categories/fruits.png'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Shop by Category',
                style: TextStyle(
                    color: AppColors.darkGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 85.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  for (String key in shopCategory.keys)
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: CategoryCard(
                        imagePath: shopCategory[key]!,
                        categoryName: key,
                      ),
                    ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Check out our products',
                style: TextStyle(
                    color: AppColors.darkGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CurvedBottomNavBar(),
      ),
    );
  }
}

class CurvedBottomNavBar extends StatelessWidget {
  const CurvedBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      animationDuration: const Duration(milliseconds: 300),
      color: AppColors.darkGreen,
      backgroundColor: Colors.white,
      items: [
        CurvedNavigationBarItem(
          child: FaIcon(
            FontAwesomeIcons.shop,
            color: AppColors.lightGreen,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.discount,
            color: AppColors.lightGreen,
          ),
        ),
        CurvedNavigationBarItem(
          child: FaIcon(
            FontAwesomeIcons.cartShopping,
            color: AppColors.lightGreen,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.favorite,
            color: AppColors.lightGreen,
          ),
        )
      ],
    );
  }
}
