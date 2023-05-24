import 'package:flutter_template/domain/entities/galery.dart';

abstract class GaleryRepository {
  Future<Galery> getGaleryByMovieId(String movieId);
}
