import 'package:dio/dio.dart';
import 'package:flutter_template/infrastructure/mappers/images_mapper.dart';
import 'package:flutter_template/infrastructure/models/images.dart';

import '../../config/environment/environment.dart';
import '../../domain/entities/galery.dart';
import '../../domain/repositories/galery_repository.dart';

class GaleryRepositoryImpl extends GaleryRepository {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDBKey,
        'language': 'en',
      },
    ),
  );
  @override
  Future<Galery> getGaleryByMovieId(String movieId) async {
    final response = await _dio.get('/movie/$movieId/images');
    final movieImages = MovieDBImages.fromJson(response.data);
    final galery = ImagesMapper.movieDBImagesToGalery(movieImages);
    return galery;
  }
}
