import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entities/actor.dart';
import 'package:flutter_template/presentation/providers/actors/actors_usecase_provider.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
  (ref) {
    final getActorsCallBack =
        ref.watch(actorsUseCaseProvider).getActorsByMovieId;

    return ActorsByMovieNotifier(getActorsCallBack: getActorsCallBack);
  },
);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallBack getActorsCallBack;

  ActorsByMovieNotifier({required this.getActorsCallBack}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final newActors = await getActorsCallBack(movieId);
    state = {...state, movieId: newActors};
  }
}

typedef GetActorsCallBack = Future<List<Actor>> Function(String movieId);
