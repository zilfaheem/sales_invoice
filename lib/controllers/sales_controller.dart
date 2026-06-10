import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/route_names.dart';

class SalesController extends ChangeNotifier {
  final salesIdCtrl = TextEditingController();
  final invoiceNoCtrl = TextEditingController();
  final customerNameCtrl = TextEditingController();

  String fromDate = '2026-05-10';
  String toDate = '2026-06-09';
  int currentPage = 1;
  final int totalPages = 58;

  final List<List<String>> rows = const [
    [
      '1572',
      '1572',
      '2026-06-09',
      'CASH CUSTOMER',
      'CASH CUSTOMER',
      '',
      'CASH',
      '5',
      '3',
      '40.00',
      '6.01',
    ],
    [
      '1571',
      '1571',
      '2026-06-09',
      'CASH CUSTOMER',
      'CASH CUSTOMER',
      '',
      'CASH',
      '1',
      '2',
      '21.74',
      '3.27',
    ],
    [
      '1570',
      '1570',
      '2026-06-09',
      'MUSTAFA MOUSA AL RAMADAN TRADING EST',
      'MUSTAFA MOUSA AL RAMADAN TRADING EST',
      'sales invoice from pos',
      'CASH',
      '1',
      '1',
      '91.30',
      '13.70',
    ],
    [
      '1569',
      '1569',
      '2026-06-08',
      'CASH CUSTOMER',
      'CASH CUSTOMER',
      '',
      'CASH',
      '1',
      '1',
      '56.52',
      '8.48',
    ],
  ];

  @override
  void dispose() {
    salesIdCtrl.dispose();
    invoiceNoCtrl.dispose();
    customerNameCtrl.dispose();
    super.dispose();
  }

  Future<void> pickDate(BuildContext context, bool isFrom) async {
    final initial =
        DateTime.tryParse(isFrom ? fromDate : toDate) ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;
    final formatted =
        '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';

    if (isFrom) {
      fromDate = formatted;
    } else {
      toDate = formatted;
    }
    notifyListeners();
  }

  void clearFilters() {
    salesIdCtrl.clear();
    invoiceNoCtrl.clear();
    customerNameCtrl.clear();
    fromDate = '2026-05-10';
    toDate = '2026-06-09';
    notifyListeners();
  }

  void setPage(int page) {
    currentPage = page;
    notifyListeners();
  }

  void onAddNewSales(BuildContext context) {
    context.push(RouteNames.newSales);
  }

  void goTo(int page) {
    if (page < 1 || page > totalPages || page == currentPage) return;

    currentPage = page;
    notifyListeners();
  }

  void next() => goTo(currentPage + 1);

  void previous() => goTo(currentPage - 1);

  void first() => goTo(1);

  void last() => goTo(totalPages);

  List<int?> get pages {
    if (totalPages <= 5) {
      return List.generate(totalPages, (i) => i + 1);
    }

    if (currentPage <= 3) {
      return [1, 2, 3, null, totalPages];
    }

    if (currentPage >= totalPages - 2) {
      return [1, null, totalPages - 2, totalPages - 1, totalPages];
    }

    return [
      1,
      null,
      currentPage - 1,
      currentPage,
      currentPage + 1,
      null,
      totalPages,
    ];
  }
}
