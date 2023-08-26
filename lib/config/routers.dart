import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ultra_market/pages/pages.dart';
import 'package:ultra_market/repositories/user/user_repository.dart';
import 'package:ultra_market/repositories/auth/auth_repository.dart';
import 'package:ultra_market/blocs/auth/auth_bloc.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/sign',
      builder: (context, state) => MultiRepositoryProvider(
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
    GoRoute(
      path: '/market',
      builder: (context, state) => const MarketPlacePage(),
    ),
  ],
);
