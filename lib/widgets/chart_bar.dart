import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/main_screen.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal});

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: constraint.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(height: constraint.maxHeight * 0.05),
          SizedBox(
            height: constraint.maxHeight * 0.6,
            width: constraint.maxWidth * 0.25,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1.5),
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: constraint.maxHeight * 0.05),
          SizedBox(
            height: constraint.maxHeight * 0.15,
            child: FittedBox(
              child: Text(
                label,
              ),
            ),
          )
        ],
      );
    });
  }
}
