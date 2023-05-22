import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/delegates/search_movie_delegate.dart';
import 'package:flutter_template/presentation/providers/movies/movies_usecase_provider.dart';

import '../../../config/theme/app_theme.dart';

class CustomSearchWidget extends ConsumerWidget {
  const CustomSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 1, bottom: 1),
          height: 41,
          decoration: BoxDecoration(
            color: AppTheme.primarySoft,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  final moviesUseCase = ref.read(moviesUseCaseProvider);
                  showSearch(
                    context: context,
                    delegate: SearchMovieDelagate(
                      searchMovieCallBack: moviesUseCase.searchMovies,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: AppTheme.textColorGrey,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  style:
                      AppTheme.h5Medium.copyWith(color: AppTheme.textColorGrey),
                  cursorColor: AppTheme.textColorGrey,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search a title ...',
                    hintStyle: AppTheme.h5Medium
                        .copyWith(color: AppTheme.textColorGrey),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 2,
                height: 18,
                color: AppTheme.textColorGrey,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune_rounded,
                  color: AppTheme.textColorDarkGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
