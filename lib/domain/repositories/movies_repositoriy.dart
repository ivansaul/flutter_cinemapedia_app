import '../entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getUpComng({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<Movie> getMovieDetail(String movieId);
}
