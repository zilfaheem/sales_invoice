import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../controllers/sales_controller.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/app_button.dart';
import 'filter_field.dart';
import 'pagination_widget.dart';
import 'sales_data_table.dart';

class SalesInvoiceListScreen extends StatelessWidget {
  const SalesInvoiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SalesController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TopBar(onAddNewSales: () => controller.onAddNewSales(context)),
          const SizedBox(height: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _FilterRow1(
                    salesIdCtrl: controller.salesIdCtrl,
                    fromDate: controller.fromDate,
                    toDate: controller.toDate,
                    onPickFrom: () => controller.pickDate(context, true),
                    onPickTo: () => controller.pickDate(context, false),
                    onFilter: () {},
                  ),
                  const SizedBox(height: 8),

                  _FilterRow2(
                    invoiceNoCtrl: controller.invoiceNoCtrl,
                    customerNameCtrl: controller.customerNameCtrl,
                    onClearFilter: () => controller.clearFilters(),
                  ),
                  const SizedBox(height: 10),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.divider),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                AppDataTable(
                                  columns: const [
                                    SalesTableColumn(
                                      label: 'Sales\nId',
                                      minWidth: 70,
                                    ),
                                    SalesTableColumn(
                                      label: 'Inv.\nNo',
                                      minWidth: 70,
                                    ),
                                    SalesTableColumn(
                                      label: 'Inv. Date',
                                      minWidth: 110,
                                    ),
                                    SalesTableColumn(
                                      label: 'User Name',
                                      minWidth: 200,
                                    ),
                                    SalesTableColumn(
                                      label: 'Cust. Name',
                                      minWidth: 200,
                                    ),
                                    SalesTableColumn(
                                      label: 'Narration',
                                      minWidth: 150,
                                    ),
                                    SalesTableColumn(
                                      label: 'Pay.\nMode',
                                      minWidth: 80,
                                    ),
                                    SalesTableColumn(
                                      label: 'Qty',
                                      minWidth: 60,
                                    ),
                                    SalesTableColumn(
                                      label: 'Items',
                                      minWidth: 60,
                                    ),
                                    SalesTableColumn(
                                      label: 'Gross\nAmount',
                                      minWidth: 100,
                                    ),
                                    SalesTableColumn(
                                      label: 'Vat\nAmount',
                                      minWidth: 90,
                                    ),
                                  ],
                                  rows: controller.rows,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  PaginationWidget(),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onAddNewSales});
  final VoidCallback onAddNewSales;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(
                Icons.arrow_back,
                size: 22,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Sales Invoice List',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          PrimaryButton(
            label: 'Add New Sales',
            icon: Icons.add,
            onPressed: onAddNewSales,
          ),
        ],
      ),
    );
  }
}

class _FilterRow1 extends StatelessWidget {
  const _FilterRow1({
    required this.salesIdCtrl,
    required this.fromDate,
    required this.toDate,
    required this.onPickFrom,
    required this.onPickTo,
    required this.onFilter,
  });

  final TextEditingController salesIdCtrl;
  final String fromDate;
  final String toDate;
  final VoidCallback onPickFrom;
  final VoidCallback onPickTo;
  final VoidCallback onFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 220,
          child: FilterField(
            hint: 'Sales Id',
            controller: salesIdCtrl,
            suffixIcon: Icons.open_in_new_outlined,
          ),
        ),
        const SizedBox(width: 12),
        const Spacer(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Invoice From Date',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.textLabel,
              ),
            ),
            const SizedBox(height: 3),
            DateFilterField(value: fromDate, onTap: onPickFrom, width: 200),
          ],
        ),
        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Invoice To Date',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.textLabel,
              ),
            ),
            const SizedBox(height: 3),
            DateFilterField(value: toDate, onTap: onPickTo, width: 200),
          ],
        ),
        const SizedBox(width: 12),

        PrimaryButton(
          label: 'Filter',
          icon: Icons.filter_list,
          onPressed: onFilter,
        ),
      ],
    );
  }
}

class _FilterRow2 extends StatelessWidget {
  const _FilterRow2({
    required this.invoiceNoCtrl,
    required this.customerNameCtrl,
    required this.onClearFilter,
  });

  final TextEditingController invoiceNoCtrl;
  final TextEditingController customerNameCtrl;
  final VoidCallback onClearFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 220,
          child: FilterField(
            hint: 'Invoice No',
            controller: invoiceNoCtrl,
            suffixIcon: Icons.open_in_new_outlined,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilterField(
            hint: 'Customer Name',
            controller: customerNameCtrl,
            suffixIcon: Icons.open_in_new_outlined,
          ),
        ),
        const SizedBox(width: 12),
        OutlinedAppButton(
          label: 'Clear Filter',
          icon: Icons.refresh,
          onPressed: onClearFilter,
        ),
      ],
    );
  }
}
