import 'package:uuid/uuid.dart';

class Transaction {
  final String id = const Uuid().v4();
  final String title;
  double amount;
  final DateTime date;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
  });

  factory Transaction.forChart({
    required double amount,
    required DateTime date,
  }) =>
      Transaction(
        title: '',
        amount: amount,
        date: date,
      );
}
