import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransActionsList;

  const TransactionList({super.key, required this.userTransActionsList});

  @override
  Widget build(BuildContext context) {
    return userTransActionsList.isEmpty
        ? Column(
            children: [
              const Text(
                'No Transaction Added Yet',
                style: TextStyle(fontFamily: 'OpenSans', fontSize: 25.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/waiting.png',
                height: 200,
                //fit: BoxFit.contain,
              ),
            ],
          )
        : SizedBox(
            height: 400,
            child: Scrollbar(
              thickness: 15.0,
              child: ListView.builder(
                //reverse: true,
                itemCount: userTransActionsList.length,
                itemBuilder: (context, index) => Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 9.0, vertical: 5.0),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                      child: Text(
                        '\$${userTransActionsList[index].amount.toStringAsFixed(2).substring(0, 5)}',
                        style: const TextStyle(
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                    ),
                    title: Text(
                      userTransActionsList[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd()
                          .add_jm()
                          .format(userTransActionsList[index].date),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
