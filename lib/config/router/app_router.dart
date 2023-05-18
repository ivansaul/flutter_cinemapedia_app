import 'package:flutter_template/presentation/screens/home_screen.dart';
import 'package:flutter_template/presentation/screens/test_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) => const TestScren(),
    ),
  ],
);
