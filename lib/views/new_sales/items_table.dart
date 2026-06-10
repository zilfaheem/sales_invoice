import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class ItemsTable extends StatelessWidget {
  final List<List<String>> rows;
  final VoidCallback onAddRow;
  final void Function(int) onDeleteRow;

  const ItemsTable({
    super.key,
    required this.rows,
    required this.onAddRow,
    required this.onDeleteRow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _TableHeader(),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: rows.length,
              separatorBuilder: (_, __) => const Divider(
                height: 1,
                thickness: 1,
                color: AppColors.tableDivider,
              ),
              itemBuilder: (context, index) {
                return _ItemRow(
                  slNo: index + 1,
                  onAdd: onAddRow,
                  onDelete: () => onDeleteRow(index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: AppColors.tableHeaderBg,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: const Row(
        children: [
          _HeaderCell(label: 'SL No', width: 56),
          _HeaderCell(label: 'ITEM CODE', width: 110),
          _HeaderCell(label: 'BARCODE NO', width: 120),
          _HeaderCell(label: 'ITEM NAME', flex: 4),
          _HeaderCell(label: 'UOM', width: 90),
          _HeaderCell(label: 'QTY', width: 70),
          _HeaderCell(label: 'RATE', width: 80),
          _HeaderCell(label: 'GROSS\nAMOUNT', width: 100),
          _HeaderCell(label: 'VAT AMOUNT', width: 100),
          _HeaderCell(label: 'NET AMOUNT', width: 100),
          _HeaderCell(label: 'ACTION', width: 70),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String label;
  final double? width;
  final int flex;

  const _HeaderCell({required this.label, this.width, this.flex = 1});

  @override
  Widget build(BuildContext context) {
    final Widget content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
    if (width != null) {
      return SizedBox(
        width: width,
        child: Center(child: content),
      );
    }
    return Expanded(
      flex: flex,
      child: Center(child: content),
    );
  }
}

class _ItemRow extends StatelessWidget {
  final int slNo;
  final VoidCallback onAdd;
  final VoidCallback onDelete;

  const _ItemRow({
    required this.slNo,
    required this.onAdd,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CellData(text: '$slNo', width: 56),
          const _CellInput(width: 110),
          const _CellInput(width: 120),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Expanded(child: _CellInput()),
                  const SizedBox(width: 4),
                  _AddButton(onTap: onAdd),
                ],
              ),
            ),
          ),
          const _CellInput(width: 90, hint: 'Select UO...'),
          const _CellInput(width: 70),
          const _CellInput(width: 80),
          const _CellInput(width: 100),
          const _CellInput(width: 100),
          const _CellInput(width: 100),
          SizedBox(
            width: 70,
            child: Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onDelete,
                  child: const Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: AppColors.danger,
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

class _CellData extends StatelessWidget {
  final String text;
  final double width;
  const _CellData({required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}

class _CellInput extends StatelessWidget {
  final double? width;
  final String? hint;

  const _CellInput({this.width, this.hint});

  @override
  Widget build(BuildContext context) {
    final Widget field = SizedBox(
      height: 36,
      child: TextFormField(
        style: const TextStyle(fontSize: 12, color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: AppColors.textDisabled,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppColors.inputBorder,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppColors.inputBorder,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppColors.inputFocusedBorder,
              width: 1.5,
            ),
          ),
          filled: true,
          fillColor: AppColors.inputFill,
        ),
      ),
    );
    if (width != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: SizedBox(width: width, child: field),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: field,
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(Icons.add, size: 16, color: AppColors.textOnPrimary),
      ),
    );
  }
}
