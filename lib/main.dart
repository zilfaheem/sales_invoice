import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/login_controller.dart';
import 'controllers/new_sales_controller.dart';
import 'controllers/sales_controller.dart';
import 'core/theme/app_theme.dart';
import 'router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => SalesController()),
        ChangeNotifierProvider(create: (_) => NewSalesController()),
      ],
      child: const InvoboxApp(),
    ),
  );
}

class InvoboxApp extends StatelessWidget {
  const InvoboxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'INVOBOX ERP',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: AppRouter.router,
    );
  }
}
