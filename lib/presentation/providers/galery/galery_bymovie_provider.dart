import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entities/galery.dart';
import 'package:flutter_template/presentation/providers/galery/galery_usecase_provider.dart';

final galeryByMovieProvider =
    StateNotifierProvider<GaleryByMovieNotifier, Map<String, Galery>>((ref) {
  final getGaleryCallBack = ref.watch(galeryUseCaseProvider).getGaleryByMovieId;
  return GaleryByMovieNotifier(getGaleryCallBack: getGaleryCallBack);
});

class GaleryByMovieNotifier extends StateNotifier<Map<String, Galery>> {
  final GetGaleryCallBack getGaleryCallBack;
  GaleryByMovieNotifier({required this.getGaleryCallBack}) : super({});

  Future<void> loadGalery(String movieId) async {
    if (state[movieId] != null) return;
    final newGalery = await getGaleryCallBack(movieId);
    state = {...state, movieId: newGalery};
  }
}

typedef GetGaleryCallBack = Future<Galery> Function(String movieId);
