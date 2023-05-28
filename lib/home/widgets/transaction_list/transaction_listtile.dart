import 'dart:collection';

import 'package:expense_tracker/classes/transaction.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/constants.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(kDefaultBorderRadius),
          ),
          color: Colors.white,
          boxShadow: kDefaultBoxShadow,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: kAscentColor,
            radius: 30,
            child: Text(
              NumberFormat.simpleCurrency(
                name: '₱',
              ).format(transaction.amount),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 14,
                ),
          ),
          subtitle: Text(
            DateFormat.yMMMMd().format(
              transaction.date,
            ),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 12,
                ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              context.read<TransactionProvider>().removeTransaction(
                    transaction: transaction,
                  );
            },
          ),
        ),
      ),
    );
  }
}
