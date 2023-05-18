import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
