import 'package:flutter_template/presentation/screens/screens.dart';
import 'package:flutter_template/presentation/screens/test_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieDetailScreen(movieId: movieId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) => const TestScren(),
    ),
    GoRoute(
      path: '/search',
      name: SearchMoviesScreen.name,
      builder: (context, state) => const SearchMoviesScreen(),
    ),
  ],
);
