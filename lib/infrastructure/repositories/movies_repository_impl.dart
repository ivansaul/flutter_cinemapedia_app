import 'package:dio/dio.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/domain/entities/movie.dart';
import 'package:flutter_template/domain/repositories/movies_repositoriy.dart';
import 'package:flutter_template/infrastructure/entities/movie_db_response.dart';
import 'package:flutter_template/infrastructure/mappers/moviedb_mapper.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDBKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _dio.get('/movie/now_playing');
    final data = response.data;
    final MovieDBResponse movieDBResponse = MovieDBResponse.fromJson(data);
    final resultsMovieDB = movieDBResponse.results;
    final results = resultsMovieDB
        .map((movieDB) => MovieDBMapper.moviedbToMovie(movieDB))
        .toList();
    return results;
  }

  @override
  Future<List<Movie>> upComng({int page = 1}) async {
    final response = await _dio.get('/movie/upcoming');
    final data = response.data;
    final MovieDBResponse movieDBResponse = MovieDBResponse.fromJson(data);
    final resultsMovieDB = movieDBResponse.results;
    final results = resultsMovieDB
        .map((movieDB) => MovieDBMapper.moviedbToMovie(movieDB))
        .toList();
    return results;
  }
}
