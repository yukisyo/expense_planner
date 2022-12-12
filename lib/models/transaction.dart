import 'package:flutter/cupertino.dart';

class Transaction {
  String id;
  String title;
  double mount;
  DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.mount,
    required this.date,
  });
}
