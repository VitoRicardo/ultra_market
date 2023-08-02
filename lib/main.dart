import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra_market/repositories/auth/auth_repository.dart';
import 'repositories/user/user_repository.dart';
import 'blocs/auth/auth_bloc.dart';
import 'pages/pages.dart';
import 'bloc_observer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ultra Market',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => AuthRepository()),
            RepositoryProvider(create: (context) => UserRepository()),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthBloc(
                  authRepository: context.read<AuthRepository>(),
                  userRepository: context.read<UserRepository>(),
                ),
              ),
            ],
            child: const SignPage(),
          ),
        ),
      ),
    );
  }
}
