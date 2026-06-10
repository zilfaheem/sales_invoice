import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewSalesController extends ChangeNotifier {
  final custNameCtrl = TextEditingController();
  final remarkCtrl = TextEditingController();
  final discountCtrl = TextEditingController(text: '0.00');

  String taxType = 'VAT';
  String transType = 'CASH';
  String paymentMode = 'CREDIT';
  bool select80mmPrinter = false;

  final List<List<String>> itemRows = [
    ['', '', '', '', '', '', '', '', ''],
  ];

  @override
  void dispose() {
    custNameCtrl.dispose();
    remarkCtrl.dispose();
    discountCtrl.dispose();
    super.dispose();
  }

  void addItemRow() {
    itemRows.add(['', '', '', '', '', '', '', '', '']);
    notifyListeners();
  }

  void deleteItemRow(int index) {
    if (itemRows.length <= 1) return;
    itemRows.removeAt(index);
    notifyListeners();
  }

  void setPaymentMode(String? mode) {
    if (mode == null) return;
    paymentMode = mode;
    notifyListeners();
  }

  void setTransType(String? type) {
    if (type == null) return;
    transType = type;
    notifyListeners();
  }

  void setSelect80mm(bool? value) {
    if (value == null) return;
    select80mmPrinter = value;
    notifyListeners();
  }

  void onSave() {}

  void onImport() {}

  void onCancel() {}

  void onClose(BuildContext context) {
    context.pop();
  }
}
