import 'package:expense_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/home/widgets/bar_graph/expense_progress.dart';

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding + 10,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          boxShadow: kDefaultBoxShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Row(
            //temporary
            children: [
              ExpenseProgress(
                amount: 5000,
                date: DateTime.now(),
                maxAmount: 10000,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
