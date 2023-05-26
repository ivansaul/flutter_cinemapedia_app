import 'package:flutter_template/domain/entities/user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDataSource {
  late Future<Isar> db;
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([UserSchema], directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  IsarDataSource() {
    db = openDB();
  }
}
