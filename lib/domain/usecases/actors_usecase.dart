import 'package:flutter_template/domain/repositories/actors_repository.dart';

import '../entities/actor.dart';

class ActorsUseCase {
  final ActorsRepository actorsRepository;
  ActorsUseCase(this.actorsRepository);

  Future<List<Actor>> getActorsByMovieId(String movieId) {
    return actorsRepository.getActorsByMovieId(movieId);
  }
}
