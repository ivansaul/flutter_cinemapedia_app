import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: AppTheme.primaryDark,
              pinned: true,
              // floating: true,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CustomAppBar(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: CustomSearchWidget(),
              ),
            ),
            const SliverToBoxAdapter(
              child: HorizontalSwipper(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: AppTheme.h4Semibold,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 39,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppTheme.primarySoft,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'All',
                                  style: AppTheme.h6Medium,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    color: Colors.amber,
                    height: 100,
                  ),
                );
              },
            )
          ],
        ),
        
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class HorizontalSwipper extends StatelessWidget {
  const HorizontalSwipper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://via.placeholder.com/288x188",
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 7,
                            offset: Offset(0, 7),
                          ),
                        ],
                      ),
                    );
                  }
                  return child;
                },
              ),
            ),
          );
        },
        itemCount: 10,
        viewportFraction: 0.8,
        scale: 0.85,
        pagination: const SwiperPagination(
          margin: EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: AppTheme.primaryBlueAccent,
            color: AppTheme.primarySoft,
            size: 8,
            activeSize: 8,
          ),
        ),
        autoplay: true,
      ),
    );
  }
}

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 1, bottom: 1),
      height: 41,
      decoration: BoxDecoration(
        color: AppTheme.primarySoft,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppTheme.textColorGrey,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: AppTheme.h5Medium.copyWith(color: AppTheme.textColorGrey),
              cursorColor: AppTheme.textColorGrey,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a title ...',
                hintStyle:
                    AppTheme.h5Medium.copyWith(color: AppTheme.textColorGrey),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 2,
            height: 18,
            color: AppTheme.textColorGrey,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune_rounded,
              color: AppTheme.textColorDarkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
