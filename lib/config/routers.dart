import 'package:go_router/go_router.dart';
import 'package:ultra_market/pages/pages.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/sign',
      builder: (context, state) => const SignPage(),
    ),
    GoRoute(
      path: '/market',
      builder: (context, state) => const MarketPlacePage(),
    ),
  ],
);
