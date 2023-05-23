import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/movie.dart';

typedef SearchMovieCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelagate extends SearchDelegate<Movie?> {
  final SearchMovieCallBack searchMovieCallBack;

  SearchMovieDelagate({required this.searchMovieCallBack});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear_rounded),
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // return const Text('build results');
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppTheme.primaryDark,
      child: FutureBuilder(
        future: searchMovieCallBack(query),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          final movies = snapshot.data ?? [];
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = movies[index];
              return _CardView(movie: movie);
            },
          );
        },
      ),
    );
  }
}

class _CardView extends StatelessWidget {
  const _CardView({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 140,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      movie.posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 8,
                  child: RatingTag(rating: movie.voteAverage),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 4,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryOrange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Premium',
                      style: AppTheme.h6Medium,
                    ),
                  ),
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.h4Semibold,
                  ),
                  TextIcon(
                    iconData: Icons.date_range,
                    content: movie.releaseDate.year.toString(),
                  ),
                  const TextIcon(
                    iconData: Icons.access_time,
                    content: '148 Minutes',
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push('/movie/${movie.id}');
                    },
                    child: const TextIcon(
                      iconData: Icons.local_movies_rounded,
                      content: 'Action',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
