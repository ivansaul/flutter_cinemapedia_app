import 'package:flutter_template/domain/entities/movie.dart';

import '../models/moviedb.dart';
import '../models/moviedb_detail.dart';

class MovieDBMapper {
  static Movie moviedbToMovie(MovieDB movieDB) {
    return Movie(
      adult: movieDB.adult,
      backdropPath: (movieDB.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
          : 'https://photos.wavebid.com/images/noimage.png',
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: (movieDB.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
          : 'https://photos.wavebid.com/images/noimage.png',
      releaseDate: movieDB.releaseDate ?? DateTime.now(),
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount,
    );
  }

  static Movie moviedbDetailToMovie(MovieDbDetail movieDbDetail) {
    return Movie(
      adult: movieDbDetail.adult,
      backdropPath: (movieDbDetail.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieDbDetail.backdropPath}'
          : 'https://photos.wavebid.com/images/noimage.png',
      genreIds: movieDbDetail.genres.map((e) => e.name).toList(),
      id: movieDbDetail.id,
      originalLanguage: movieDbDetail.originalLanguage,
      originalTitle: movieDbDetail.originalTitle,
      overview: movieDbDetail.overview,
      popularity: movieDbDetail.popularity,
      posterPath: (movieDbDetail.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieDbDetail.posterPath}'
          : 'https://photos.wavebid.com/images/noimage.png',
      releaseDate: movieDbDetail.releaseDate,
      title: movieDbDetail.title,
      video: movieDbDetail.video,
      voteAverage: movieDbDetail.voteAverage,
      voteCount: movieDbDetail.voteCount,
    );
  }
}
