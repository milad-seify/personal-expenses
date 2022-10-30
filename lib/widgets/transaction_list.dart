import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransActions;

  const TransactionList(this.userTransActions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 400,
        child: Scrollbar(
          thickness: 15.0,
          child: ListView.builder(
            //reverse: true,
            itemCount: userTransActions.length,
            itemBuilder: (context, index) => Card(
              elevation: 5.0,
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.purple, width: 2.0),
                  ),
                  child: Text(
                    '\$${userTransActions[index].amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ),
                title: Text(
                  userTransActions[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  DateFormat.yMMMEd()
                      .add_jm()
                      .format(userTransActions[index].date),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
