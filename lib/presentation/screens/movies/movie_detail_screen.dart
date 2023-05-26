import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/config/helpers/push_image_viewer.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/domain/entities/actor.dart';
import 'package:flutter_template/domain/entities/galery.dart';
import 'package:flutter_template/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/movie.dart';
import '../../providers/providers.dart';
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
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
    ref.read(galeryByMovieProvider.notifier).loadGalery(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieDetailProvider)[widget.movieId];
    if (movie == null) {
      return const LoadingScreen();
    }
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppTheme.primaryDark,
            floating: true,
            pinned: true,
            automaticallyImplyLeading: false,
            // expandedHeight: size.height * 0.6,
            expandedHeight: 525,
            title: _AppBarTitle(movie: movie),
            flexibleSpace: FlexibleSpaceBar(
              background: _AppBarBackground(movie: movie),
            ),
          ),

          // Body
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _SynopsisView(movie: movie),
                _CastView(movieId: widget.movieId),
                _GaleryView(movieId: widget.movieId),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GaleryView extends ConsumerWidget {
  final String movieId;
  const _GaleryView({
    required this.movieId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Galery? galery = ref.watch(galeryByMovieProvider)[movieId];
    if (galery == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Galery', style: AppTheme.h3Semibold),
          const SizedBox(height: 10),
          SizedBox(
            height: 160,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: galery.backdrops.length,
              itemBuilder: (BuildContext context, int index) {
                final backdrop = galery.backdrops[index];
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 250,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: GestureDetector(
                      onTap: () => ImageViewer.push(context, backdrop.filePath),
                      child: Hero(
                        tag: backdrop.filePath,
                        child: Image.network(
                          backdrop.filePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
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
              const EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 80),
              SizedBox(
                width: 205,
                height: 287,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: GestureDetector(
                    onTap: () => ImageViewer.push(context, movie.posterPath),
                    child: Hero(
                      tag: movie.posterPath,
                      child: Image.network(
                        movie.posterPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextIcon(
                    iconData: Icons.date_range,
                    content: movie.releaseDate.year.toString(),
                  ),
                  Container(
                    width: 1,
                    height: 15,
                    color: AppTheme.textColorGrey,
                  ),
                  const TextIcon(
                    iconData: Icons.access_time,
                    content: '148 Minutes',
                  ),
                  Container(
                    width: 1,
                    height: 15,
                    color: AppTheme.textColorGrey,
                  ),
                  TextIcon(
                    iconData: Icons.local_movies_rounded,
                    content: movie.genreIds[0],
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
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                        Text('Play', style: AppTheme.h4Medium),
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
                      Icons.ios_share_rounded,
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

class _AppBarTitle extends ConsumerWidget {
  const _AppBarTitle({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isfavorite = ref.watch(isFavoriteMovieProvider(movie.id));
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
          child: Icon(
            Icons.favorite,
            color: (isfavorite.when(
              data: (data) {
                // print('data $data');
                return data ? Colors.orange : Colors.white;
              },
              error: (error, stackTrace) => Colors.red,
              loading: () => Colors.amber,
            )),
            size: 18,
          ),
          onTap: () async {
            await ref.watch(localUseCaseProvider).toggleFavorite(movie);
            ref.invalidate(isFavoriteMovieProvider(movie.id));
            ref.invalidate(loadFavoritesProvider);
          },
        ),
      ],
    );
  }
}

class _SynopsisView extends StatelessWidget {
  const _SynopsisView({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Synopsis', style: AppTheme.h3Semibold),
          const SizedBox(height: 10),
          Text(
            movie.overview,
            style:
                AppTheme.h5Regular.copyWith(color: AppTheme.textColorWhiteGrey),
          ),
        ],
      ),
    );
  }
}

class _CastView extends ConsumerWidget {
  final String movieId;

  const _CastView({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Actor>? actors = ref.watch(actorsByMovieProvider)[movieId];
    if (actors == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cast and Crew', style: AppTheme.h3Semibold),
          const SizedBox(height: 15),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: actors.length,
              itemBuilder: (BuildContext context, int index) {
                final Actor actor = actors[index];
                return FadeInRight(
                  child: Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              ImageViewer.push(context, actor.profilePath),
                          child: Hero(
                            tag: actor.profilePath,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(actor.profilePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(actor.name, style: AppTheme.h5Semibold),
                            Text(
                              actor.character ?? '',
                              style: AppTheme.h7Medium
                                  .copyWith(color: AppTheme.textColorGrey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
