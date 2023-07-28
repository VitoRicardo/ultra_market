import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/sign_in_tab.dart';
import 'widgets/sign_up_tab.dart';
import 'package:ultra_market/config/app_colors.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            SizedBox(
              height: 70.h,
              child: TabBar(
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                indicatorColor: AppColors.lightGreen,
                labelColor: AppColors.darkGreen,
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text(
                      'Sign In',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Sign Up',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  SignInTab(),
                  SignUpTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
