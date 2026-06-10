import 'package:go_router/go_router.dart';

import '../views/auth/login_screen.dart';
import '../views/home/sales_invoice_list_screen.dart';
import '../views/new_sales/new_sales_screen.dart';
import 'route_names.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.salesList,
        builder: (context, state) => const SalesInvoiceListScreen(),
      ),
      GoRoute(
        path: RouteNames.newSales,
        builder: (context, state) => const NewSalesScreen(),
      ),
    ],
  );
}
