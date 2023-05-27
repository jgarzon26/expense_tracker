import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:expense_tracker/classes/transaction.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(title: 'Test', amount: 1000, date: DateTime.now()),
    Transaction(
        title: 'Test 2',
        amount: 500,
        date: DateTime.now().subtract(const Duration(days: 1))),
  ];
  UnmodifiableListView<Transaction> get transactions =>
      UnmodifiableListView(_transactions);

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
    notifyListeners();
  }
}
