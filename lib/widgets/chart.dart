import 'package:flutter/material.dart';
import './chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({super.key, required this.recentTransactions});
  List<Map<String, dynamic>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalAmount = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }
      // print(DateFormat().format(weekDay));
      // print(totalAmount);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalAmount
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionsValues.fold(
        0.0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return recentTransactions.isEmpty
        ? Divider(
            color: Colors.yellow.shade300,
            endIndent: 40.0,
            indent: 40.0,
            thickness: 20.0,
          )
        : Card(
            elevation: 5.0,
            color: Colors.amber,
            child: Card(
              elevation: 6.0,
              margin: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: groupedTransactionsValues.map((data) {
                    return Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          label: data['day'],
                          spendingAmount: data['amount'],
                          spendingPctOfTotal: totalSpending == 0.0
                              ? 0.0
                              : data['amount'] / totalSpending),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
  }
}
