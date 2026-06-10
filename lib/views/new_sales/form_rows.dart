import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/widgets/app_dropdown_field.dart';
import '../../core/widgets/app_text_field.dart';
import 'new_sales_helpers.dart';

class FormRow1 extends StatelessWidget {
  final TextEditingController custNameCtrl;
  const FormRow1({super.key, required this.custNameCtrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ReadOnlyField(label: 'Sales Id', value: '1572', flex: 2),
        const SizedBox(width: 12),
        const ReadOnlyField(
          label: 'Invoice Date',
          value: '2026-06-09',
          flex: 3,
          suffixIcon: Icons.calendar_today_outlined,
        ),
        const SizedBox(width: 12),
        const ReadOnlyField(
          label: 'Invoice Time',
          value: '03:05 PM',
          flex: 3,
          suffixIcon: Icons.access_time,
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 4,
          child: _InputWithButton(
            label: 'Cust.Name / Mobile No',
            controller: custNameCtrl,
            hint: 'Cust.Name / Mobile No',
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          flex: 3,
          child: DoubleFieldColumn(
            label: 'To Aspect AC Details',
            leftValue: '3',
            rightValue: 'Sales',
            leftWidth: 60,
          ),
        ),
      ],
    );
  }
}

class FormRow2 extends StatelessWidget {
  final String taxType;
  final String paymentMode;
  final ValueChanged<String?> onPaymentModeChanged;

  const FormRow2({
    super.key,
    required this.taxType,
    required this.paymentMode,
    required this.onPaymentModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReadOnlyField(label: 'Tax Type', value: taxType, flex: 2),
        const SizedBox(width: 12),
        const ReadOnlyField(label: 'Invoice No', value: '1572', flex: 2),
        const SizedBox(width: 12),
        const Expanded(
          flex: 3,
          child: DoubleFieldColumn(
            label: 'User ID & Name',
            leftValue: '1',
            rightValue: 'admin',
            leftWidth: 60,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const NewSalesLabel('Payment ID & Mode'),
              const SizedBox(height: 4),
              Row(
                children: [
                  const SizedBox(
                    width: 60,
                    child: AppTextField(initialValue: '2', readOnly: true),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: AppDropdownField<String>(
                      value: paymentMode,
                      onChanged: onPaymentModeChanged,
                      items: const [
                        DropdownMenuItem(value: 'CASH', child: Text('CASH')),
                        DropdownMenuItem(
                          value: 'CREDIT',
                          child: Text('CREDIT'),
                        ),
                        DropdownMenuItem(value: 'CARD', child: Text('CARD')),
                        DropdownMenuItem(
                          value: 'CHEQUE',
                          child: Text('CHEQUE'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          flex: 3,
          child: DoubleFieldColumn(
            label: 'By Aspect AC Details',
            leftValue: '1',
            rightValue: 'CASH',
            leftWidth: 60,
          ),
        ),
      ],
    );
  }
}

class FormRow3 extends StatelessWidget {
  final String transType;
  final TextEditingController remarkCtrl;
  final ValueChanged<String?> onTransTypeChanged;

  const FormRow3({
    super.key,
    required this.transType,
    required this.remarkCtrl,
    required this.onTransTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ReadOnlyField(label: 'Till Code', value: 'Till02', flex: 2),
        const SizedBox(width: 12),
        const Expanded(
          flex: 3,
          child: DoubleFieldColumn(
            label: 'To Branch ID & Name',
            leftValue: '1',
            rightValue: 'Al Khaleej Mubasher Tr',
            leftWidth: 50,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const NewSalesLabel('Trans Type'),
              const SizedBox(height: 4),
              AppDropdownField<String>(
                value: transType,
                onChanged: onTransTypeChanged,
                items: const [
                  DropdownMenuItem(value: 'CASH', child: Text('CASH')),
                  DropdownMenuItem(value: 'CREDIT', child: Text('CREDIT')),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 4,
          child: AppTextField(
            label: 'Remark desc',
            hint: 'Enter the Remark desc',
            controller: remarkCtrl,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          flex: 4,
          child: AppTextField(
            label: 'Current Customer Bal',
            hint: 'Enter the Current Customer Bal',
            readOnly: true,
          ),
        ),
      ],
    );
  }
}

class _InputWithButton extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;

  const _InputWithButton({
    required this.label,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: AppTextField(label: label, controller: controller, hint: hint),
        ),
        const SizedBox(width: 4),
        SizedBox(
          width: 40,
          height: 42,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textOnPrimary,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 0,
            ),
            child: const Icon(Icons.add, size: 20),
          ),
        ),
      ],
    );
  }
}
