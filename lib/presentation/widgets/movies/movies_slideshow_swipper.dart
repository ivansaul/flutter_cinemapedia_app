import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/movie.dart';

import '../../../config/theme/app_theme.dart';

class MoviesSlideShowSwipper extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideShowSwipper({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Swiper(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return _Slide(movie: movies[index]);
          },
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
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(2, 7),
        ),
      ],
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                movie.backdropPath,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                      ),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie.title,
                      style: AppTheme.h5Semibold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      movie.releaseDate,
                      style: AppTheme.h6Regular.copyWith(
                        color: AppTheme.primaryBlueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
