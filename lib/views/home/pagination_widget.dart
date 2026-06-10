import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controllers/sales_controller.dart';

import '../../core/utils/app_colors.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SalesController>(
      builder: (_, pagination, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: pagination.currentPage > 1 ? pagination.first : null,
              icon: const Icon(Icons.first_page),
            ),

            IconButton(
              onPressed: pagination.currentPage > 1
                  ? pagination.previous
                  : null,
              icon: const Icon(Icons.chevron_left),
            ),

            ...pagination.pages.map((page) {
              if (page == null) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text('...'),
                );
              }

              final selected = page == pagination.currentPage;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: FilledButton(
                  onPressed: () => pagination.goTo(page),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(36, 36),
                    shape: const CircleBorder(),
                    backgroundColor: selected
                        ? AppColors.primary
                        : Colors.transparent,
                    foregroundColor: selected
                        ? AppColors.textOnPrimary
                        : AppColors.textPrimary,
                    elevation: 0,
                  ),
                  child: Text('$page'),
                ),
              );
            }),

            IconButton(
              onPressed: pagination.currentPage < pagination.totalPages
                  ? pagination.next
                  : null,
              icon: const Icon(Icons.chevron_right),
            ),

            IconButton(
              onPressed: pagination.currentPage < pagination.totalPages
                  ? pagination.last
                  : null,
              icon: const Icon(Icons.last_page),
            ),
          ],
        );
      },
    );
  }
}
