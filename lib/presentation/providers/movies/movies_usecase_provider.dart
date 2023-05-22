import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/movies_usecase.dart';
import '../../../infrastructure/repositories/movies_repository_impl.dart';

final moviesUseCaseProvider = Provider<MoviesUseCase>((ref) {
  return MoviesUseCase(MoviesRepositoryImpl());
});
