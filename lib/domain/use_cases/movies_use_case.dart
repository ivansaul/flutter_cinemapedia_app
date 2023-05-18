import 'package:flutter_template/domain/repositories/movies_repositoriy.dart';

import '../entities/movie.dart';

class MoviesUseCase {
  final MoviesRepository moviesRepository;

  MoviesUseCase(this.moviesRepository);

  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesRepository.getNowPlaying();
  }

  Future<List<Movie>> upComing({int page = 1}) {
    return moviesRepository.getNowPlaying();
  }
}
