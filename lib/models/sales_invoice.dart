class SalesInvoice {
  final String id;
  final String invoiceNo;
  final String date;
  final String userName;
  final String customerName;
  final String narration;
  final String paymentMode;
  final double qty;
  final int items;
  final double grossAmount;
  final double vatAmount;

  SalesInvoice({
    required this.id,
    required this.invoiceNo,
    required this.date,
    required this.userName,
    required this.customerName,
    required this.narration,
    required this.paymentMode,
    required this.qty,
    required this.items,
    required this.grossAmount,
    required this.vatAmount,
  });

  double get netAmount => grossAmount + vatAmount;
}
