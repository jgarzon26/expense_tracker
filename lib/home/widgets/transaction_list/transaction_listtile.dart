import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/constants.dart';
import 'package:intl/intl.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    super.key,
    required this.amount,
    required this.title,
    required this.date,
  });

  final double amount;
  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding,
      ),
      sliver: SliverToBoxAdapter(
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
                ).format(amount),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 14,
                  ),
            ),
            subtitle: Text(
              DateFormat.yMMMMd().format(
                date,
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
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
