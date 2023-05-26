import 'package:flutter_template/domain/entities/movie.dart';

abstract class LocalDbRepository {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int movieId);
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0});
}
