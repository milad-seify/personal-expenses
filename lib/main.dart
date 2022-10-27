import 'package:flutter/material.dart';
import "./transaction.dart";
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'eat pizza', amount: 12.5, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'buy shoes', amount: 40.5, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Expenses'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5.0,
                color: Colors.amber,
                child: Text(
                  'CHART',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Card(
              elevation: 6.0,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'title'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'amount'),
                    ),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.purple,
                        ),
                        child: Text(
                          'Transaction',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ),
            ),
            Column(
                children: transactions.map((tx) {
              return Card(
                elevation: 5.0,
                child: ListTile(
                    leading: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: Colors.purple, width: 2.0)),
                        child: Text(
                          '\$${tx.amount}',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        )),
                    title: Text(tx.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle:
                        Text(DateFormat.yMMMEd().add_jm().format(tx.date))),
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
