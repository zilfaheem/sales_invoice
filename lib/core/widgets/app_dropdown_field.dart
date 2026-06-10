import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';

class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    super.key,
    this.label,
    required this.value,
    required this.items,
    this.onChanged,
    this.hint,
    this.enabled = true,
    this.labelStyle,
  });

  final String? label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? hint;
  final bool enabled;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final Widget dropdown = DropdownButtonFormField<T>(
      initialValue: value,
      items: items,
      onChanged: enabled ? onChanged : null,
      style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 18,
        color: AppColors.primary,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textDisabled, fontSize: 13),
      ),
      dropdownColor: AppColors.surface,
      menuMaxHeight: 280,
      borderRadius: BorderRadius.circular(AppSizes.borderRadius),
    );

    if (label == null) return dropdown;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label!,
          style:
              labelStyle ??
              const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
        ),
        const SizedBox(height: 4),
        dropdown,
      ],
    );
  }
}
