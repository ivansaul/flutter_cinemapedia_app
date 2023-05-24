import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/usecases/galery_use_case.dart';
import 'package:flutter_template/infrastructure/repositories/galery_repository_impl.dart';

final galeryUseCaseProvider = Provider<GaleryUseCase>((ref) {
  return GaleryUseCase(GaleryRepositoryImpl());
});
