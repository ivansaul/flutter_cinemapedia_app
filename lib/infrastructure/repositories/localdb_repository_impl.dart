import 'package:flutter_template/domain/entities/movie.dart';
import 'package:flutter_template/domain/repositories/localdb_repository.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDbRepositoryImpl extends LocalDbRepository {
  late Future<Isar> db;

  LocalDbRepositoryImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [MovieSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final Isar isar = await db;
    final movie = await isar.movies.filter().idEqualTo(movieId).findFirst();
    if (movie == null) {
      return false;
    }
    return true;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) async {
    final Isar isar = await db;
    final movies = await isar.movies.where().offset(offset).limit(limit).findAll();
    return movies;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final Isar isar = await db;
    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();
    if (favoriteMovie == null) {
      // print('agregando');
      return await isar.writeTxn(() async {
        await isar.movies.put(movie);
      });
    }
    // print('eliminando');
    await isar.writeTxn(() async {
      await isar.movies.delete(favoriteMovie.isarId);
    });
  }
}
