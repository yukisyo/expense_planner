import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transactions,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final void Function(String id)? deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$${widget.transactions.mount}'),
          ),
        ),
        title: Text(
          widget.transactions.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(DateFormat.yMd().format(widget.transactions.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton(
                onPressed: () => widget.deleteTx!(widget.transactions.id),
                child: const Text('Delete'))
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => widget.deleteTx!(widget.transactions.id),
              ),
      ),
    );
  }
}
