import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_sizes.dart';

class SalesTableColumn {
  const SalesTableColumn({
    required this.label,
    this.flex = 1,
    this.minWidth,
    this.alignment = Alignment.centerLeft,
    this.textAlign = TextAlign.left,
  });

  final String label;
  final int flex;
  final double? minWidth;
  final Alignment alignment;
  final TextAlign textAlign;
}

class AppDataTable extends StatelessWidget {
  const AppDataTable({
    super.key,
    required this.columns,
    required this.rows,

    this.emptyMessage = 'No records found',
  });

  final List<SalesTableColumn> columns;

  final List<List<String>> rows;

  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: AppSizes.tableHeaderHeight,
          color: AppColors.tableHeaderBg,
          child: Row(
            children: [
              ..._buildHeaderCells(),

              const SizedBox(
                width: 80,
                child: Center(
                  child: Text(
                    'Action',
                    style: TextStyle(
                      color: AppColors.textOnPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        if (rows.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Text(
                emptyMessage,
                style: const TextStyle(
                  color: AppColors.textDisabled,
                  fontSize: 13,
                ),
              ),
            ),
          )
        else
          ...rows.asMap().entries.map(
            (e) => _SalesTableRow(
              index: e.key,
              cells: e.value,
              columns: columns,
              isEven: e.key.isEven,
            ),
          ),
      ],
    );
  }

  List<Widget> _buildHeaderCells() {
    return columns.map((col) {
      Widget cell = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          col.label,
          textAlign: col.textAlign,
          style: const TextStyle(
            color: AppColors.textOnPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      );

      if (col.minWidth != null) {
        return SizedBox(
          width: col.minWidth,
          child: Align(alignment: col.alignment, child: cell),
        );
      }
      return Expanded(flex: col.flex, child: cell);
    }).toList();
  }
}

class _SalesTableRow extends StatefulWidget {
  const _SalesTableRow({
    required this.index,
    required this.cells,
    required this.columns,
    required this.isEven,
  });

  final int index;
  final List<String> cells;
  final List<SalesTableColumn> columns;
  final bool isEven;

  @override
  State<_SalesTableRow> createState() => _SalesTableRowState();
}

class _SalesTableRowState extends State<_SalesTableRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    Color bg = widget.isEven ? AppColors.tableRowEven : AppColors.tableRowOdd;
    if (_hovered) bg = AppColors.hoverOverlay;

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        color: _hovered ? AppColors.primary.withOpacity(0.06) : bg,
        child: Column(
          children: [
            Row(children: [..._buildCells(), _buildActionCell()]),
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.tableDivider,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCells() {
    return widget.columns.asMap().entries.map((e) {
      final col = e.value;
      final text = e.key < widget.cells.length ? widget.cells[e.key] : '';

      Widget cell = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Text(
          text,
          textAlign: col.textAlign,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      );

      if (col.minWidth != null) {
        return SizedBox(width: col.minWidth, child: cell);
      }
      return Expanded(flex: col.flex, child: cell);
    }).toList();
  }

  Widget _buildActionCell() {
    return SizedBox(
      width: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit_outlined),
            color: AppColors.primary,
            tooltip: 'Edit',
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.print_outlined),
            color: AppColors.primary,
            tooltip: 'Print',
          ),
        ],
      ),
    );
  }
}
