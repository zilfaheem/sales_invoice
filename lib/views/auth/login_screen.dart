import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:task/core/utils/app_sizes.dart';
import 'package:task/core/utils/app_validators.dart';

import '../../controllers/login_controller.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800, minWidth: 400),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _InvoboxLogo(),
                const SizedBox(height: 20),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 28, 28, 20),
                    child: Consumer<LoginController>(
                      builder: (context, controller, _) {
                        return Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AppTextField(
                                label: 'Username',
                                controller: controller.usernameCtrl,
                                focusNode: controller.usernameFocus,
                                nextFocusNode: controller.passwordFocus,

                                validator: AppValidators.username,
                              ),
                              const SizedBox(height: 18),

                              AppTextField(
                                label: 'Password',
                                controller: controller.passwordCtrl,
                                focusNode: controller.passwordFocus,
                                obscureText: true,

                                validator: AppValidators.strongPassword,
                              ),
                              const SizedBox(height: 22),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.check_box,
                                    color: AppColors.success,
                                    size: 22,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'Saved Domain: ${controller.savedDomain}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.savedDomain,
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.edit_outlined,
                                        size: 20,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  SizedBox(
                                    width: 22,
                                    height: 22,
                                    child: Checkbox(
                                      value: controller.rememberMe,
                                      onChanged: (v) => controller
                                          .toggleRememberMe(v ?? false),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const _CloudCubexLogo(),
                                  SizedBox(width: AppSizes.md),
                                  PrimaryButton(
                                    label: 'Login',
                                    width: 110,
                                    onPressed: () {
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        context.go('/sales-list');
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  DangerButton(
                                    label: 'Exit',
                                    width: 100,
                                    onPressed: controller.onExit,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InvoboxLogo extends StatelessWidget {
  const _InvoboxLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primary, width: 2),
              ),
            ),
            Positioned(
              bottom: -5,
              child: const Icon(Icons.check, color: Colors.black87, size: 52),
            ),
          ],
        ),
        const SizedBox(width: 12),
        const Text(
          'INVOBOX',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryDark,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}

class _CloudCubexLogo extends StatelessWidget {
  const _CloudCubexLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(
            Icons.cloud_outlined,
            color: Colors.white,
            size: 18,
          ),
        ),
        const SizedBox(width: 8),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'cloudcubex',
              style: TextStyle(
                letterSpacing: 4,
                fontSize: 15,
                fontWeight: FontWeight.w700,

                color: AppColors.primary,
              ),
            ),
            Text(
              'Simplifying Your Business',
              style: TextStyle(
                fontSize: 9,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
