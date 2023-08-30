import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ultra_market/cubits/sign_in/sign_in_cubit.dart';
import 'package:ultra_market/pages/pages.dart';
import 'package:ultra_market/repositories/auth/auth_repository.dart';

import '../blocs/auth/auth_bloc.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider<SignInCubit>(
        create: (_) =>
            SignInCubit(authRepository: context.read<AuthRepository>()),
        child: const WelcomePage(),
      ),
    ),
    GoRoute(
      path: '/sign',
      builder: (context, state) => const SignPage(),
    ),
    GoRoute(
      path: '/market',
      builder: (context, state) => BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(authRepository: context.read<AuthRepository>()),
        child: const MarketPlacePage(),
      ),
    ),
  ],
);
