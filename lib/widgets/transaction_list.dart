import 'package:expense_planner/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  void Function(String id)? deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  const Text('No data'),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView(
              children: transactions
                  .map((e) => TransactionItem(
                        key: ValueKey(e.id),
                        transactions: e,
                        deleteTx: deleteTx,
                      ))
                  .toList(),
            ),

      // .builder(
      //     itemBuilder: (ctx, index) {
      //       return transaction_item(
      //           transactions: transactions[index], deleteTx: deleteTx);
      //     },
      //     itemCount: transactions.length,
      //   ),
    );
  }
}
