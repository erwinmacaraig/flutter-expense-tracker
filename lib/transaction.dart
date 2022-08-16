// import 'package:flutter/foundation.dart';

// normal blueprint
class Transaction {
  final String id;
  final String title;
  final double amount;

  final DateTime date;
  // built into Dart

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
