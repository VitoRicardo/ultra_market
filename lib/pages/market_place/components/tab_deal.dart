import 'package:flutter/material.dart';
import 'package:ultra_market/config/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabDeals extends StatefulWidget {
  final List<Widget> tabDealsWidgets;
  const TabDeals({Key? key, required this.tabDealsWidgets}) : super(key: key);

  @override
  State<TabDeals> createState() => _TabDealsState();
}

class _TabDealsState extends State<TabDeals> with TickerProviderStateMixin {
  late final TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabDealsWidgets.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160.h,
          width: double.infinity,
          child: TabBarView(
            controller: _tabController,
            children: widget.tabDealsWidgets,
          ),
        ),
        Center(
          child: TabPageSelector(
            controller: _tabController,
            selectedColor: AppColors.darkGreen,
          ),
        )
      ],
    );
  }
}
