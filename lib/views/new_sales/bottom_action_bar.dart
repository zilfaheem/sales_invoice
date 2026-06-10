import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/widgets/app_button.dart';

class BottomActionBar extends StatelessWidget {
  final bool select80mm;
  final ValueChanged<bool?> onSelect80mmChanged;
  final VoidCallback onSave;
  final VoidCallback onImport;
  final VoidCallback onCancel;
  final VoidCallback onClose;

  const BottomActionBar({
    super.key,
    required this.select80mm,
    required this.onSelect80mmChanged,
    required this.onSave,
    required this.onImport,
    required this.onCancel,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
      child: Row(
        children: [
          Checkbox(
            value: select80mm,
            onChanged: onSelect80mmChanged,
            side: const BorderSide(color: AppColors.textSecondary, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 8),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => onSelect80mmChanged(!select80mm),
              child: const Text(
                'Select 80 mm Printer',
                style: TextStyle(fontSize: 13, color: AppColors.primary),
              ),
            ),
          ),
          const Spacer(),
          PrimaryButton(label: 'Save - F12', width: 130, onPressed: onSave),
          const SizedBox(width: 10),
          PrimaryButton(label: 'Import', width: 110, onPressed: onImport),
          const SizedBox(width: 10),
          PrimaryButton(label: 'Cancel', width: 110, onPressed: onCancel),
          const SizedBox(width: 10),
          PrimaryButton(label: 'Close', width: 110, onPressed: onClose),
        ],
      ),
    );
  }
}
