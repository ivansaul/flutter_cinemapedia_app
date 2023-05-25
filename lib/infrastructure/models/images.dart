class MovieDBImages {
  final List<MovieDBImage> backdrops;
  final int id;
  final List<MovieDBImage> logos;
  final List<MovieDBImage> posters;

  MovieDBImages({
    required this.backdrops,
    required this.id,
    required this.logos,
    required this.posters,
  });

  factory MovieDBImages.fromJson(Map<String, dynamic> json) => MovieDBImages(
        backdrops: List<MovieDBImage>.from(
            json["backdrops"].map((x) => MovieDBImage.fromJson(x))),
        id: json["id"],
        logos:
            List<MovieDBImage>.from(json["logos"].map((x) => MovieDBImage.fromJson(x))),
        posters: List<MovieDBImage>.from(
            json["posters"].map((x) => MovieDBImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "backdrops": List<dynamic>.from(backdrops.map((x) => x.toJson())),
        "id": id,
        "logos": List<dynamic>.from(logos.map((x) => x.toJson())),
        "posters": List<dynamic>.from(posters.map((x) => x.toJson())),
      };
}

class MovieDBImage {
  final double aspectRatio;
  final int height;
  final String iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  MovieDBImage({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory MovieDBImage.fromJson(Map<String, dynamic> json) => MovieDBImage(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
      };
}
