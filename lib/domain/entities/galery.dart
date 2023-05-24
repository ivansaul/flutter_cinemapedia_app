class MovieImage {
  final String filePath;
  final int width;
  final int height;
  final double aspectRatio;

  MovieImage({
    required this.filePath,
    required this.width,
    required this.height,
    required this.aspectRatio,
  });
}

class Galery {
  final int id;
  final List<MovieImage> posters;
  final List<MovieImage> backdrops;

  Galery({
    required this.id,
    required this.posters,
    required this.backdrops,
  });
}
