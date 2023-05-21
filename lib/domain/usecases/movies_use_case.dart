import 'package:flutter_template/domain/repositories/movies_repositoriy.dart';

import '../entities/movie.dart';

class MoviesUseCase {
  final MoviesRepository moviesRepository;

  MoviesUseCase(this.moviesRepository);

  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesRepository.getNowPlaying(page: page);
  }

  Future<List<Movie>> getUpComing({int page = 1}) {
    return moviesRepository.getNowPlaying(page: page);
  }

  Future<List<Movie>> getTopRated({int page = 1}) {
    return moviesRepository.getTopRated(page: page);
  }

  Future<List<Movie>> getPopular({int page = 1}) {
    return moviesRepository.getPopular(page: page);
  }

  Future<Movie> getMovieDetail(String movieId) {
    return moviesRepository.getMovieDetail(movieId);
  }
}
