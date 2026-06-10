import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/widgets/app_text_field.dart';

class NewSalesLabel extends StatelessWidget {
  final String text;
  const NewSalesLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: AppColors.textLabel,
      ),
    );
  }
}

class ReadOnlyField extends StatelessWidget {
  final String label;
  final String value;
  final int flex;
  final IconData? suffixIcon;

  const ReadOnlyField({
    super.key,
    required this.label,
    required this.value,
    required this.flex,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: AppTextField(
        label: label,
        initialValue: value,
        readOnly: true,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, size: 16, color: AppColors.primary)
            : null,
      ),
    );
  }
}

class DoubleFieldColumn extends StatelessWidget {
  final String label;
  final String leftValue;
  final String rightValue;
  final double leftWidth;

  const DoubleFieldColumn({
    super.key,
    required this.label,
    required this.leftValue,
    required this.rightValue,
    required this.leftWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        NewSalesLabel(label),
        const SizedBox(height: 4),
        Row(
          children: [
            SizedBox(
              width: leftWidth,
              child: AppTextField(initialValue: leftValue, readOnly: true),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: AppTextField(initialValue: rightValue, readOnly: true),
            ),
          ],
        ),
      ],
    );
  }
}
