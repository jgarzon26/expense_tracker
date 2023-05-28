import 'package:expense_tracker/constants.dart';
import 'package:expense_tracker/home/overlays/input_transaction.dart';
import 'package:expense_tracker/home/widgets/bar_graph/expense_chart.dart';
import 'package:expense_tracker/home/widgets/transaction_list/transaction_pane.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const InputTransaction(),
              );
            },
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const InputTransaction(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
