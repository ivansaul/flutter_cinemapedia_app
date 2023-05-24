import '../entities/galery.dart';
import '../repositories/galery_repository.dart';

class GaleryUseCase {
  final GaleryRepository galeryRepository;

  GaleryUseCase(this.galeryRepository);
  Future<Galery> getGaleryByMovieId(String movieId) {
    return galeryRepository.getGaleryByMovieId(movieId);
  }
}
