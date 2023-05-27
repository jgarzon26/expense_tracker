import 'package:uuid/uuid.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
  }) : id = const Uuid().v4();
}
