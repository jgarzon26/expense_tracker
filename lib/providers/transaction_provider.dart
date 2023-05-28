import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:expense_tracker/classes/transaction.dart';
import 'package:expense_tracker/date_data.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [];
  UnmodifiableListView<Transaction> get transactions =>
      UnmodifiableListView(_transactions);

  final List<Transaction> _chartTransactions =
      List.generate(dates.length, (index) => 
      Transaction.forChart(
        amount: 0, 
        date: dates[index],
        )
      );
  UnmodifiableListView<Transaction> get chartTransactions => 
    UnmodifiableListView(_chartTransactions);

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
    notifyListeners();
  }
}
