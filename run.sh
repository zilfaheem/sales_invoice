#!/bin/bash

echo "🚀 Bootstrapping Invobox MVC Architecture..."

# 1. Create Directory Structure
mkdir -p lib/models
mkdir -p lib/views
mkdir -p lib/controllers
mkdir -p lib/utils
mkdir -p lib/theme
mkdir -p lib/widgets

echo "📁 Directories created."

# 2. Generate Utils (Colors & Sizes)
cat << 'EOF' > lib/utils/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1E9BEB);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color danger = Color(0xFFC0392B);
  static const Color success = Color(0xFF27AE60);
  static const Color background = Color(0xFFEEEEF5);
  static const Color surface = Color(0xFFF5F5FA);
  static const Color inputFill = Color(0xFFF0F0F8);
  static const Color inputBorder = Color(0xFF1E9BEB);
  static const Color inputFocusedBorder = Color(0xFF1565C0);
  static const Color tableHeaderBg = Color(0xFF1E9BEB);
  static const Color tableRowEven = Color(0xFFFFFFFF);
  static const Color tableRowOdd = Color(0xFFF8F9FF);
  static const Color tableDivider = Color(0xFFDDDDEE);
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF555570);
  static const Color textDisabled = Color(0xFF9999BB);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textLabel = Color(0xFF1E9BEB);
  static const Color hoverOverlay = Color(0x0D1E9BEB);
  static const Color checkboxActive = Color(0xFF7B1FA2);
  static const Color savedDomain = Color(0xFF27AE60);
  static const Color divider = Color(0xFFDDDDEE);
  static const Color shadow = Color(0x1A000000);
}
EOF

cat << 'EOF' > lib/utils/app_sizes.dart
class AppSizes {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
  
  static const double inputHeight = 42.0;
  static const double buttonHeight = 44.0;
  static const double tableRowHeight = 56.0;
  static const double tableHeaderHeight = 48.0;
  
  static const double cardPadding = 24.0;
  static const double fieldGap = 12.0;
  static const double sectionGap = 20.0;
  static const double borderRadius = 6.0;
}
EOF

# 3. Generate App Theme
cat << 'EOF' > lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Segoe UI',
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.primaryDark,
        error: AppColors.danger,
        surface: AppColors.surface,
        onPrimary: AppColors.textOnPrimary,
        onSurface: AppColors.textPrimary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputFill,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          borderSide: const BorderSide(color: AppColors.inputBorder, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          borderSide: const BorderSide(color: AppColors.inputBorder, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          borderSide: const BorderSide(color: AppColors.inputFocusedBorder, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          borderSide: const BorderSide(color: AppColors.divider, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          borderSide: const BorderSide(color: AppColors.danger, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          borderSide: const BorderSide(color: AppColors.danger, width: 2),
        ),
        hintStyle: const TextStyle(color: AppColors.textDisabled, fontSize: 13),
        labelStyle: const TextStyle(color: AppColors.textLabel, fontSize: 12, fontWeight: FontWeight.w600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          disabledBackgroundColor: AppColors.textDisabled,
          minimumSize: const Size(80, 44),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.borderRadius)),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.2),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          minimumSize: const Size(80, 44),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.borderRadius)),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.checkboxActive;
          return Colors.transparent;
        }),
        side: const BorderSide(color: AppColors.checkboxActive, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        overlayColor: WidgetStateProperty.all(AppColors.hoverOverlay),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.divider, thickness: 1, space: 1),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 3,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.zero,
      ),
    );
  }
}
EOF

# 4. Generate Main
cat << 'EOF' > lib/main.dart
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'views/login_screen.dart';
import 'views/sales_invoice_list_screen.dart';
import 'views/new_sales_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const InvoboxApp());
}

class InvoboxApp extends StatelessWidget {
  const InvoboxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INVOBOX ERP',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/sales-list': (_) => const SalesInvoiceListScreen(),
        '/new-sales': (_) => const NewSalesScreen(),
      },
    );
  }
}
EOF

echo "✅ MVC Refactoring Complete!"
