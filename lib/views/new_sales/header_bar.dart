import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/app_colors.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const _IconBox(icon: Icons.menu_book_outlined),
          const SizedBox(width: 12),
          const Text(
            'New Sales',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          _IconButton(
            icon: Icons.arrow_back_ios_new,
            onTap: () => context.pop(),
          ),
          const SizedBox(width: 16),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.textDisabled.withValues(alpha: 0.2),
            child: const Icon(
              Icons.person_outline,
              size: 24,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBox extends StatelessWidget {
  final IconData icon;
  const _IconBox({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: AppColors.textOnPrimary, size: 20),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _IconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Icon(icon, size: 20, color: AppColors.primary),
      ),
    );
  }
}
