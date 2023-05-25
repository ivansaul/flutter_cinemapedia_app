import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/search/search_movies_screen.dart';

import '../../../config/theme/app_theme.dart';
import '../../views/views.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  final int pageIndex;
  const HomeScreen({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  final viewRoutes = const [
    HomeView(),
    FavoriteView(),
    // SizedBox(),
    SearchMoviesScreen(),
    SizedBox(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomNavigationBar(selectedIndex: pageIndex),
    );
  }
}
