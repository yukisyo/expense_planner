import 'package:expense_planner/widgets/chart_bar.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      recentTransactions.where((item) {
        return DateFormat.yMd().format(item.date) ==
            DateFormat.yMd().format(weekDay);
      }).forEach((item) {
        totalSum += item.mount;
      });
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get maxSending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.4,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionValues.map((item) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  spendingLable: item['day'].toString(),
                  spendingAmount: item['amount'] as double,
                  spendingPctOfTotal: 0,
                  // spendingPctOfTotal: (item['amount'] as double) / maxSending,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
