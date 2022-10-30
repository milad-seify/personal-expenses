import 'package:flutter/material.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransActions = [
    Transaction(
        id: 't1', title: 'eat pizza', amount: 12.5, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'buy shoes', amount: 40.5, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'buy shirt', amount: 31.5, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTrans = Transaction(
        id: '1', title: txTitle, amount: txAmount, date: DateTime.now());

    setState(() {
      _userTransActions.add(newTrans);
    });
  }

  void _startAddTransaction(BuildContext cxt) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: cxt,
      builder: (_) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: NewTransaction(_addNewTransaction),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Personal Expenses'),
          actions: <Widget>[
            IconButton(
              onPressed: () => _startAddTransaction(context),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
              TransactionList(_userTransActions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddTransaction(context),
          child: const Icon(Icons.add),
        ));
  }
}
