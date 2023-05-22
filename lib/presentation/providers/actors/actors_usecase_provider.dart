import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/actors_usecase.dart';
import '../../../infrastructure/repositories/actors_repository_impl.dart';

final actorsUseCaseProvider = Provider<ActorsUseCase>((ref) {
  return ActorsUseCase(ActorsRepositoryImpl());
});
