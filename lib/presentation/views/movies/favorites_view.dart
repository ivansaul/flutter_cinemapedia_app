import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/domain/entities/movie.dart';
import 'package:flutter_template/presentation/providers/localdb/localdb_usecase_provider.dart';
import 'package:flutter_template/presentation/widgets/shared/custom_iconbotton.dart';
import 'package:go_router/go_router.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Column(
            children: [
              _AppBarView(),
              _BodyView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BodyView extends ConsumerWidget {
  const _BodyView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(loadFavoritesProvider);

    return movies.when(
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
      data: (movies) => Expanded(
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            final movie =movies[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              width: 330,
              height: 122,
              decoration: BoxDecoration(
                  color: AppTheme.primarySoft,
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        movie.backdropPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Action',
                          style: AppTheme.h6Medium.copyWith(
                            color: AppTheme.textColorGrey,
                          ),
                        ),
                        Text(
                          movie.title,
                          style: AppTheme.h5Semibold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: AppTheme.secondaryOrange,
                              size: 18,
                            ),
                            Text(
                              8.72.toStringAsFixed(1),
                              style: AppTheme.h5Semibold.copyWith(
                                color: AppTheme.secondaryOrange,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// class _BodyView extends ConsumerWidget {
//   const _BodyView();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final movies = ref.watch(loadFavoritesProvider);

//     return Expanded(
//       child: ListView.builder(
//         itemCount: movies.when(
//           data: (data) => data.length,
//           error: (error, stackTrace) => 1,
//           loading: () => 0,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             padding: const EdgeInsets.all(12),
//             width: 330,
//             height: 122,
//             decoration: BoxDecoration(
//                 color: AppTheme.primarySoft,
//                 borderRadius: BorderRadius.circular(16)),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 120,
//                   height: double.infinity,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.network(
//                       'https://i.imgur.com/LAKo9gP.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Action',
//                         style: AppTheme.h6Medium.copyWith(
//                           color: AppTheme.textColorGrey,
//                         ),
//                       ),
//                       Text(
//                         'Spider-Man No Way Home',
//                         style: AppTheme.h5Semibold,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.star_rate_rounded,
//                             color: AppTheme.secondaryOrange,
//                             size: 18,
//                           ),
//                           Text(
//                             8.72.toStringAsFixed(1),
//                             style: AppTheme.h5Semibold.copyWith(
//                               color: AppTheme.secondaryOrange,
//                             ),
//                           ),
//                           const Spacer(),
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.favorite,
//                               color: Colors.red,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class _AppBarView extends StatelessWidget {
  const _AppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text('Favorites', style: AppTheme.h4Semibold),
          Container(
            alignment: const Alignment(-1, 0),
            child: CustomIconButton(
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: AppTheme.textColorWhite,
              ),
              onTap: () {
                context.go('/');
              },
            ),
          ),
        ],
      ),
    );
  }
}
