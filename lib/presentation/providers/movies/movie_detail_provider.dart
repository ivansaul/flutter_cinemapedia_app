import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entities/movie.dart';
import 'package:flutter_template/presentation/providers/movies/movies_usecase_provider.dart';

final movieDetailProvider =
    StateNotifierProvider<MovieDetailNotifier, Map<String, Movie>>((ref) {
  final fetchMovieDetail = ref.watch(moviesUseCaseProvider).getMovieDetail;
  return MovieDetailNotifier(fetchMovieDetail: fetchMovieDetail);
});

class MovieDetailNotifier extends StateNotifier<Map<String, Movie>> {
  final MovieDetailCallBack fetchMovieDetail;
  MovieDetailNotifier({required this.fetchMovieDetail}) : super({});

  Future<void> loadMovieDetail(String movieId) async {
    if (state[movieId] != null) return;
    final movie = await fetchMovieDetail(movieId);
    state = {...state, movieId: movie};
  }
}

typedef MovieDetailCallBack = Future<Movie> Function(String movieId);
