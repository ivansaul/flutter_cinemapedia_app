import 'package:flutter_template/domain/entities/galery.dart';
import 'package:flutter_template/infrastructure/models/images.dart';

class ImagesMapper {
  static Galery movieDBImagesToGalery(MovieDBImages movieImages) {
    MovieImage movieDBImageToMovieImage(MovieDBImage movieDBImage) {
      return MovieImage(
        filePath: 'https://image.tmdb.org/t/p/w500${movieDBImage.filePath}',
        width: movieDBImage.width,
        height: movieDBImage.height,
        aspectRatio: movieDBImage.aspectRatio,
      );
    }

    final id = movieImages.id;
    final posters = movieImages.posters
        .map((movieDBImage) => movieDBImageToMovieImage(movieDBImage))
        .toList();
    final backdrops = movieImages.backdrops
        .map((movieDBImage) => movieDBImageToMovieImage(movieDBImage))
        .toList();

    return Galery(
      id: id,
      posters: posters,
      backdrops: backdrops,
    );
  }
}
