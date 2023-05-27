import 'package:expense_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseProgress extends StatelessWidget {
  const ExpenseProgress({
    super.key,
    required this.amount,
    required this.date,
    required this.maxAmount,
  });

  final double amount;
  final DateTime date;
  final double maxAmount;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width * 0.03;
    final borderRadius = BorderRadius.circular(50);

    final percent = amount / maxAmount;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          NumberFormat.simpleCurrency(
            name: '₱',
            decimalDigits: 0,
          ).format(amount),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Spacer(),
        Expanded(
          flex: 15,
          child: Stack(
            children: [
              //background
              Container(
                width: maxWidth,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: borderRadius,
                ),
              ),
              //foreground
              FractionallySizedBox(
                heightFactor: percent > 0.05 ? percent : 0.05,
                child: Container(
                  width: maxWidth,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: kAscentColor,
                    borderRadius: borderRadius,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          DateFormat.E().format(date),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
