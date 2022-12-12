import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class transaction_item extends StatelessWidget {
  const transaction_item({
    Key? key,
    required this.transactions,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final void Function(String id)? deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$${transactions.mount}'),
          ),
        ),
        title: Text(
          transactions.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(DateFormat.yMd().format(transactions.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton(
                onPressed: () => deleteTx!(transactions.id),
                child: const Text('Delete'))
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteTx!(transactions.id),
              ),
      ),
    );
  }
}
