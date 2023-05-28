import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:expense_tracker/classes/transaction.dart';
import 'package:expense_tracker/date_data.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [];
  UnmodifiableListView<Transaction> get transactions =>
      UnmodifiableListView(_transactions);

  final List<Transaction> _chartTransactions = List.generate(
      dates.length,
      (index) => Transaction.forChart(
            amount: 0,
            date: dates[index],
          ));
  UnmodifiableListView<Transaction> get chartTransactions =>
      UnmodifiableListView(_chartTransactions);

  double maxAmount = 10000.0;

  void addAndUpdateTransaction({required Transaction transaction}) {
    _transactions.add(transaction);
    notifyListeners();
    for (int i = 0; i < _chartTransactions.length; i++) {
      if (_chartTransactions[i].date.day == transaction.date.day) {
        _chartTransactions[i].amount += transaction.amount;
        break;
      }
    }
    notifyListeners();
  }

  void removeTransaction({required Transaction transaction}) {
    _transactions.remove(transaction);
    for (int i = 0; i < _chartTransactions.length; i++) {
      if (_chartTransactions[i].date.day == transaction.date.day) {
        _chartTransactions[i].amount -= transaction.amount;
        break;
      }
    }
    notifyListeners();
  }
}
