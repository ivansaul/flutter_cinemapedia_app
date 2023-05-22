import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';

class RatingTag extends StatelessWidget {
  final double rating;

  const RatingTag({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 55,
      decoration: BoxDecoration(
        color: const Color(0xff252836).withOpacity(0.9),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.star_rate_rounded,
            color: AppTheme.secondaryOrange,
            size: 18,
          ),
          Text(
            rating.toStringAsFixed(1),
            style: AppTheme.h5Semibold.copyWith(
              color: AppTheme.secondaryOrange,
            ),
          )
        ],
      ),
    );
  }
}
