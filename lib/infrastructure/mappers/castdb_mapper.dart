import 'package:flutter_template/domain/entities/actor.dart';
import 'package:flutter_template/infrastructure/models/credits.dart';

class CastDbMapper {
  static Actor castdbToActor(Cast cast) {
    return Actor(
      id: cast.id,
      name: cast.name,
      profilePath: (cast.profilePath != null)
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://i.imgur.com/dDA6s7D.jpg',
      character: cast.character,
    );
  }
}
