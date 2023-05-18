import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entities/movie.dart';
import 'package:flutter_template/domain/use_cases/movies_use_case.dart';
import 'package:flutter_template/infrastructure/repositories/movies_repository_impl.dart';

final moviesUseCaseProvider = Provider<MoviesUseCase>((ref) {
  return MoviesUseCase(MoviesRepositoryImpl());
});

final upComingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(moviesUseCaseProvider).upComing;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(moviesUseCaseProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  final MovieCallBack fetchMoreMovies;
  MoviesNotifier({required this.fetchMoreMovies}) : super([]);
  int page = 0;
  void loadNextPage() async {
    page++;
    final newMovies = await fetchMoreMovies(page: page);
    state = [...state, ...newMovies];
  }
}

typedef MovieCallBack = Future<List<Movie>> Function({int page});
