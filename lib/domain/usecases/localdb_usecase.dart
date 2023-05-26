import 'package:flutter_template/domain/repositories/localdb_repository.dart';

import '../entities/movie.dart';

class LocalDbUseCase {
  final LocalDbRepository localDbRepository;

  LocalDbUseCase(this.localDbRepository);

  Future<void> toggleFavorite(Movie movie) {
    return localDbRepository.toggleFavorite(movie);
  }

  Future<bool> isMovieFavorite(int movieId) {
    return localDbRepository.isMovieFavorite(movieId);
  }

  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    return localDbRepository.loadMovies(limit: limit, offset: offset);
  }
}
