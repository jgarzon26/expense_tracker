import 'package:expense_tracker/home/widgets/bar_graph/expense_chart.dart';
import 'package:expense_tracker/home/widgets/transaction_list/transaction_pane.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: const [
            ExpenseChart(),
            TransactionPane(),
          ],
        ),
      ),
    );
  }
}
