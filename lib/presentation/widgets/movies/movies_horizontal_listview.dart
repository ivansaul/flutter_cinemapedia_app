import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/domain/entities/movie.dart';

class MoviesHorizontalListView extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  const MoviesHorizontalListView({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTheme.h4Semibold,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: AppTheme.h6Regular
                    .copyWith(color: AppTheme.primaryBlueAccent),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 231,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              final Movie movie = movies[index];
              return SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Container(
                          color: AppTheme.primarySoft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 178,
                                width: double.infinity,
                                child: Image.network(
                                  // "https://i.imgur.com/LAKo9gP.jpg",
                                  movie.posterPath,
                                  fit: BoxFit.fill,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
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
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.h5Semibold,
                                    ),
                                    Text(
                                      'Action',
                                      style: AppTheme.h7Medium.copyWith(
                                          color: AppTheme.textColorGrey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            height: 25,
                            width: 55,
                            decoration: BoxDecoration(
                              color: const Color(0xff252836).withOpacity(0.9),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.star_rate_rounded,
                                  color: AppTheme.secondaryOrange,
                                  size: 18,
                                ),
                                Text(
                                  movie.voteAverage.toString(),
                                  style: AppTheme.h5Semibold.copyWith(
                                    color: AppTheme.secondaryOrange,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
