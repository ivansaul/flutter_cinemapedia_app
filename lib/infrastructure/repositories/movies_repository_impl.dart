import 'package:dio/dio.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/domain/entities/movie.dart';
import 'package:flutter_template/domain/repositories/movies_repositoriy.dart';
import 'package:flutter_template/infrastructure/mappers/moviedb_mapper.dart';

import '../models/models.dart';

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

  Future<List<Movie>> _jsonToMovies(Map<String, dynamic> json) async {
    final movieDBResponse = MovieDBResponse.fromJson(json);
    final resultsMovieDB = movieDBResponse.results;
    final movies = resultsMovieDB
        .map((movieDB) => MovieDBMapper.moviedbToMovie(movieDB))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    final MovieDBResponse movieDBResponse =
        MovieDBResponse.fromJson(response.data);
    final resultsMovieDB = movieDBResponse.results;
    final movies = resultsMovieDB
        .map((movieDB) => MovieDBMapper.moviedbToMovie(movieDB))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getUpComng({int page = 1}) async {
    final response = await _dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await _dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await _dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieDetail(String movieId) async {
    final response = await _dio.get('/movie/$movieId');
    final movieDbDetail = MovieDbDetail.fromJson(response.data);
    final movie = MovieDBMapper.moviedbDetailToMovie(movieDbDetail);
    return movie;
  }
}
