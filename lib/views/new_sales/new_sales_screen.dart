import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/new_sales_controller.dart';
import '../../../core/utils/app_colors.dart';
import 'bottom_action_bar.dart';
import 'form_rows.dart';
import 'header_bar.dart';
import 'items_table.dart';
import 'totals_bar.dart';

class NewSalesScreen extends StatelessWidget {
  const NewSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          HeaderBar(),
          Expanded(child: _FormContent()),
          TotalsBar(),
          _BottomActionWrapper(),
        ],
      ),
    );
  }
}

class _FormContent extends StatelessWidget {
  const _FormContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Selector<NewSalesController, TextEditingController>(
            selector: (_, c) => c.custNameCtrl,
            builder: (context, ctrl, _) => FormRow1(custNameCtrl: ctrl),
          ),
          const SizedBox(height: 12),

          Selector<NewSalesController, (String, String)>(
            selector: (_, c) => (c.taxType, c.paymentMode),
            builder: (context, data, _) => FormRow2(
              taxType: data.$1,
              paymentMode: data.$2,
              onPaymentModeChanged: (v) => context
                  .read<NewSalesController>()
                  .setPaymentMode(v ?? data.$2),
            ),
          ),
          const SizedBox(height: 12),

          Selector<NewSalesController, (String, TextEditingController)>(
            selector: (_, c) => (c.transType, c.remarkCtrl),
            builder: (context, data, _) => FormRow3(
              transType: data.$1,
              remarkCtrl: data.$2,
              onTransTypeChanged: (v) =>
                  context.read<NewSalesController>().setTransType(v ?? data.$1),
            ),
          ),
          const SizedBox(height: 16),

          Selector<NewSalesController, List<List<String>>>(
            selector: (_, c) => c.itemRows,
            shouldRebuild: (prev, next) => prev.length != next.length,
            builder: (context, rows, _) {
              return Consumer<NewSalesController>(
                builder: (context, controller, _) {
                  return ItemsTable(
                    rows: rows,
                    onAddRow: controller.addItemRow,
                    onDeleteRow: controller.deleteItemRow,
                  );
                },
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _BottomActionWrapper extends StatelessWidget {
  const _BottomActionWrapper();

  @override
  Widget build(BuildContext context) {
    return Selector<NewSalesController, bool>(
      selector: (_, c) => c.select80mmPrinter,
      builder: (context, select80mm, _) {
        final controller = context.read<NewSalesController>();
        return BottomActionBar(
          select80mm: select80mm,
          onSelect80mmChanged: (v) => controller.setSelect80mm(v ?? false),
          onSave: controller.onSave,
          onImport: controller.onImport,
          onCancel: controller.onCancel,
          onClose: () => controller.onClose(context),
        );
      },
    );
  }
}
