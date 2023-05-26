import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entities/movie.dart';
import 'package:flutter_template/domain/usecases/localdb_usecase.dart';
import 'package:flutter_template/infrastructure/repositories/localdb_repository_impl.dart';

final localUseCaseProvider = Provider<LocalDbUseCase>((ref) {
  return LocalDbUseCase(LocalDbRepositoryImpl());
});

final isFavoriteMovieProvider =
    FutureProvider.family<bool, int>((ref, movieId) async {
  final isfavorite = await ref.watch(localUseCaseProvider).isMovieFavorite(movieId);
  return isfavorite;
});

final loadFavoritesProvider = FutureProvider.autoDispose<List<Movie>>((ref) async {
  final favorites = await ref.watch(localUseCaseProvider).loadMovies();
  return favorites;
});
