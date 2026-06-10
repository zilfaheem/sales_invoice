import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_sizes.dart';

class FilterField extends StatelessWidget {
  const FilterField({
    super.key,
    this.hint,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.onSuffixTap,
    this.width,
  });

  final String? hint;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSuffixTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final Widget field = TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon != null
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onSuffixTap,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(suffixIcon, size: 18, color: AppColors.primary),
                  ),
                ),
              )
            : null,
      ),
    );

    if (width != null) return SizedBox(width: width, child: field);
    return field;
  }
}

class DateFilterField extends StatelessWidget {
  const DateFilterField({
    super.key,
    this.label,
    required this.value,
    this.onTap,
    this.width,
  });

  final String? label;
  final String value;
  final VoidCallback? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final Widget field = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textLabel,
            ),
          ),
          const SizedBox(height: 3),
        ],
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: AppSizes.inputHeight,
              decoration: BoxDecoration(
                color: AppColors.inputFill,
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                border: Border.all(color: AppColors.inputBorder, width: 1.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    if (width != null) return SizedBox(width: width, child: field);
    return field;
  }
}
