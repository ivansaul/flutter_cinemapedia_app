import 'package:dio/dio.dart';
import 'package:flutter_template/domain/entities/actor.dart';
import 'package:flutter_template/domain/repositories/actors_repository.dart';
import 'package:flutter_template/infrastructure/mappers/castdb_mapper.dart';
import 'package:flutter_template/infrastructure/models/credits.dart';

import '../../config/environment/environment.dart';

class ActorsRepositoryImpl extends ActorsRepository {
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
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await _dio.get('/movie/$movieId/credits');
    final credits = Credits.fromJson(response.data);
    final actors =
        credits.cast.map((cast) => CastDbMapper.castdbToActor(cast)).toList();
    return actors;
  }
}
