import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class TotalsBar extends StatelessWidget {
  const TotalsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: Column(
        children: [
          Container(height: 3, color: AppColors.primary),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Row(
              children: [
                const _TotalField(label: 'QTY', value: '0'),
                const SizedBox(width: 12),
                const _TotalField(label: 'ITEMS', value: '1'),
                const SizedBox(width: 12),
                const _TotalField(label: 'GROSS TOTAL', value: '0.00 SAR'),
                const SizedBox(width: 12),
                const _TotalField(label: 'VAT TOTALs', value: '0.0 SAR'),
                const SizedBox(width: 12),
                const _TotalField(
                  label: 'DISCOUNT TOTAL',
                  value: '0.00',
                  editable: true,
                ),
                const SizedBox(width: 12),
                const _TotalField(label: 'NET TOTAL', value: '0.00 SAR'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalField extends StatelessWidget {
  final String label;
  final String value;
  final bool editable;

  const _TotalField({
    required this.label,
    required this.value,
    this.editable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.textLabel,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 38,
            child: TextFormField(
              initialValue: value,
              readOnly: !editable,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                isDense: true,
                filled: true,
                fillColor: editable
                    ? AppColors.inputFill
                    : AppColors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: AppColors.divider,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: AppColors.divider,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: AppColors.inputFocusedBorder,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
