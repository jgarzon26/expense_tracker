import 'package:expense_tracker/constants.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionPane extends StatelessWidget {
  const TransactionPane({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = context.watch<TransactionProvider>();
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        TransactionListTile(transactionProvider: transactionProvider),
      ],
    );
  }
}

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    super.key,
    required this.transactionProvider,
  });

  final TransactionProvider transactionProvider;

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
                ).format(transactionProvider.transactions[0].amount),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            title: Text(
              transactionProvider.transactions[0].title,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 14,
                  ),
            ),
            subtitle: Text(
              DateFormat.yMMMMd().format(
                transactionProvider.transactions[0].date,
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
