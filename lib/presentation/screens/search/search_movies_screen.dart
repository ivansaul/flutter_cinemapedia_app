import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entities/movie.dart';
import 'package:flutter_template/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/app_theme.dart';
import '../../widgets/widgets.dart';

class SearchMoviesScreen extends ConsumerWidget {
  static const String name = 'search_movies_screen';
  const SearchMoviesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchMovieQueryProvider);

    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SearchWidget(),
              const SizedBox(height: 24),
              Expanded(
                child: FutureBuilder(
                  future: ref.read(moviesUseCaseProvider).searchMovies(query),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Movie>> snapshot) {
                    final movies = snapshot.data ?? [];

                    if (snapshot.hasData & movies.isEmpty & query.isNotEmpty) {
                      return const _MovieNotFound();
                    }

                    return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        final movie = movies[index];
                        return FadeInLeft(child: _CardView(movie: movie));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MovieNotFound extends StatelessWidget {
  const _MovieNotFound();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/no-results.png'),
          const SizedBox(height: 20),
          Text(
            'we are sorry, we can not find the movie :(',
            style: AppTheme.h6Semibold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Find your movie by Type title, categories, years, etc ',
            textAlign: TextAlign.center,
            style: AppTheme.h6Medium.copyWith(
              color: AppTheme.textColorGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchWidget extends ConsumerWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controller = TextEditingController(
      text: ref.read(searchMovieQueryProvider),
    );

    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 1,
        bottom: 1,
      ),
      height: 41,
      decoration: BoxDecoration(
        color: AppTheme.primarySoft,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppTheme.textColorGrey,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: (value) {
                ref
                    .read(searchMovieQueryProvider.notifier)
                    .update((state) => value);
              },
              style: AppTheme.h5Medium.copyWith(color: AppTheme.textColorGrey),
              cursorColor: AppTheme.textColorGrey,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a movie ...',
                hintStyle:
                    AppTheme.h5Medium.copyWith(color: AppTheme.textColorGrey),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              ref.read(searchMovieQueryProvider.notifier).update((state) => '');
              controller.clear();
            },
            icon: const Icon(
              Icons.clear_rounded,
              color: AppTheme.textColorDarkGrey,
            ),
          ),
        ],
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
