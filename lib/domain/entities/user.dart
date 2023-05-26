
import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id? isarId;
  final int id;
  final String name;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.age,
  });
}
