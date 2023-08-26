import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra_market/repositories/auth/auth_repository.dart';
import 'repositories/user/user_repository.dart';
import 'blocs/auth/auth_bloc.dart';
import 'pages/pages.dart';
import 'bloc_observer.dart';
import 'config/routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Ultra Market',
        routerConfig: router,
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
