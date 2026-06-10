import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/route_names.dart';

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool _rememberMe = true;
  bool get rememberMe => _rememberMe;

  final String savedDomain = 'gulfdirecttest.com';

  @override
  void dispose() {
    usernameFocus.dispose();
    passwordFocus.dispose();
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  void onLogin(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      context.go(RouteNames.salesList);
    }
  }

  void toggleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  void onExit() {}
}
