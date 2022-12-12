import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String spendingLabel;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar({
    required this.spendingLabel,
    required this.spendingAmount,
    required this.spendingPctOfTotal,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: constraints.maxHeight * 0.1,
              child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.1,
            child: FittedBox(child: Text(spendingLabel)),
          ),
        ],
      );
    });
  }
}
