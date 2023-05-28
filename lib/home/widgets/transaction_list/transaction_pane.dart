import 'package:expense_tracker/classes/transaction.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:expense_tracker/home/widgets/transaction_list/transaction_listtile.dart';
import 'package:provider/provider.dart';

class TransactionPane extends StatelessWidget {
  const TransactionPane({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<TransactionProvider>().transactions;
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        transactions.isEmpty
            ? displayEmptyTransactionsInfo(context)
            : buildTransactions(transactions),
      ],
    );
  }

  SliverToBoxAdapter displayEmptyTransactionsInfo(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'No transactions added yet!',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverList buildTransactions(UnmodifiableListView<Transaction> transactions) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: transactions.length,
        (context, index) {
          print(transactions.length);
          return TransactionListTile(
            amount: transactions[index].amount,
            title: transactions[index].title,
            date: transactions[index].date,
          );
        },
      ),
    );
  }
}
