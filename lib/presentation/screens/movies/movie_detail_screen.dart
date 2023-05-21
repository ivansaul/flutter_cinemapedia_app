import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/presentation/providers/movies/movie_detail_provider.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/movie.dart';
import '../../widgets/widgets.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  final String movieId;
  const MovieDetailScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  MovieDetailScreenState createState() => MovieDetailScreenState();
}

class MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieDetailProvider.notifier).loadMovieDetail(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieDetailProvider)[widget.movieId];
    if (movie == null) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    }
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppTheme.primaryDark,
            floating: true,
            pinned: true,
            automaticallyImplyLeading: false,
            // expandedHeight: size.height * 0.6,
            expandedHeight: 600,
            title: _AppBarTitle(movie: movie),
            flexibleSpace: FlexibleSpaceBar(
              background: _AppBarBackground(movie: movie),
            ),
          ),
          _InfoSection(movie: movie),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _AppBarBackground extends StatelessWidget {
  const _AppBarBackground({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xff1F1D2B).withOpacity(0.8),
              const Color(0xff1F1D2B),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 80),
              SizedBox(
                width: 205,
                height: 287,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    movie.posterPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.date_range,
                      color: AppTheme.textColorGrey,
                      size: 15,
                    ),
                    label: Text(
                      movie.releaseDate.year.toString(),
                      style: AppTheme.h6Medium.copyWith(
                        color: AppTheme.textColorGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 15,
                    color: AppTheme.textColorGrey,
                  ),
                  TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.access_time,
                      color: AppTheme.textColorGrey,
                      size: 15,
                    ),
                    label: Text(
                      '148 Minutes',
                      style: AppTheme.h6Medium.copyWith(
                        color: AppTheme.textColorGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 15,
                    color: AppTheme.textColorGrey,
                  ),
                  TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.local_movies_rounded,
                      color: AppTheme.textColorGrey,
                      size: 15,
                    ),
                    label: Text(
                      movie.genreIds[0],
                      style: AppTheme.h6Medium.copyWith(
                        color: AppTheme.textColorGrey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              TextButton.icon(
                onPressed: null,
                icon: const Icon(
                  Icons.star,
                  color: AppTheme.secondaryOrange,
                  size: 20,
                ),
                label: Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: AppTheme.h5Semibold.copyWith(
                    color: AppTheme.secondaryOrange,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconButton(
                    width: 115,
                    height: 48,
                    borderRadius: 32,
                    color: AppTheme.secondaryOrange,
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.ios_share_rounded,
                          color: Colors.white,
                        ),
                        Text('Share', style: AppTheme.h4Medium),
                      ],
                    ),
                  ),
                  CustomIconButton(
                    width: 48,
                    height: 48,
                    borderRadius: 48,
                    onTap: () {},
                    child: const Icon(
                      Icons.save_alt_rounded,
                      color: AppTheme.secondaryOrange,
                    ),
                  ),
                  CustomIconButton(
                    width: 48,
                    height: 48,
                    borderRadius: 48,
                    onTap: () {},
                    child: const Icon(
                      Icons.language,
                      color: AppTheme.primaryBlueAccent,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          width: 35,
          height: 35,
          borderRadius: 12,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 18,
          ),
          onTap: () => context.pop(),
        ),
        Text(
          movie.title.length > 25
              ? '${movie.title.substring(0, 25)}...'
              : movie.title,
          style: AppTheme.h4Semibold,
        ),
        CustomIconButton(
          width: 32,
          height: 32,
          borderRadius: 12,
          child: const Icon(
            Icons.favorite,
            color: Colors.white,
            size: 18,
          ),
          onTap: () => context.pop(),
        ),
      ],
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Story Line', style: AppTheme.h3Semibold),
                const SizedBox(height: 10),
                Text(
                  movie.overview,
                  style: AppTheme.h5Regular
                      .copyWith(color: AppTheme.textColorWhiteGrey),
                ),
                const SizedBox(height: 24),
                Text('Cast and Crew', style: AppTheme.h3Semibold),
                const SizedBox(height: 600),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
