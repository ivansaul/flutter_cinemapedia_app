import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/domain/entities/movie.dart';
import 'package:go_router/go_router.dart';

class SectionMovies extends StatefulWidget {
  final String title;
  final List<Movie> movies;
  final VoidCallback? loadNextPage;
  const SectionMovies({
    super.key,
    required this.title,
    required this.movies,
    this.loadNextPage,
  });

  @override
  State<SectionMovies> createState() => _SectionMoviesState();
}

class _SectionMoviesState extends State<SectionMovies> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (widget.loadNextPage == null) return;

      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 200) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Title(title: widget.title),
        const SizedBox(height: 5),
        SizedBox(
          height: 231,
          child: ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (BuildContext context, int index) {
              final Movie movie = widget.movies[index];
              return GestureDetector(
                onTap:() =>  context.push('/movie/${movie.id}'),
                child: FadeInRight(
                  child: _Card(movie: movie),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
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
                            style: AppTheme.h7Medium
                                .copyWith(color: AppTheme.textColorGrey),
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
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
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
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            style:
                AppTheme.h6Regular.copyWith(color: AppTheme.primaryBlueAccent),
          ),
        ),
      ],
    );
  }
}
