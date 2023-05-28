import 'package:expense_tracker/constants.dart';
import 'package:expense_tracker/date_data.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/home/widgets/bar_graph/expense_progress.dart';
import 'package:provider/provider.dart';

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key});

  final maxAmount = 10000.0;

  @override
  Widget build(BuildContext context) {
    final transactionProvider = context.watch<TransactionProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding + 10,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          boxShadow: kDefaultBoxShadow,
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactionProvider.chartTransactions.length,
            itemBuilder: (context, index) {
              return ExpenseProgress(
                amount: transactionProvider.chartTransactions[index].amount,
                date: transactionProvider.chartTransactions[index].date,
                maxAmount: maxAmount,
              );
            }),
      ),
    );
  }
}
