import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _checkChart = false;
  final List<Transaction> _userTransActions = [
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title1",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title2",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title3",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title4",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title5",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title6",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title7",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title8",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title9",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "title",
        amount: 12,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "titlend",
        amount: 12,
        date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions {
    return _userTransActions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime pickedDate) {
    final newTrans = Transaction(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: txTitle,
      amount: txAmount,
      date: pickedDate,
    );
    setState(() {
      _userTransActions.add(newTrans);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransActions.removeWhere((element) => element.id == id);
    });
  }

  void _startAddTransaction(BuildContext cxt) {
    showModalBottomSheet(
      backgroundColor: Colors.orange[300],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
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
    final appear =
        AppBar(title: const Text('Personal Expenses'), actions: <Widget>[
      IconButton(
          onPressed: () => _startAddTransaction(context),
          icon: const Icon(Icons.add, color: Colors.tealAccent))
    ]);
    return Scaffold(
        appBar: appear,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ChartBar'),
                  Switch(
                      value: _checkChart,
                      onChanged: (val) {
                        setState(() {
                          _checkChart = val;
                        });
                      }),
                ],
              ),
              _checkChart == true
                  ? SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              appear.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(recentTransactions: _recentTransactions))
                  : SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              appear.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: TransactionList(
                          userTransActionsList: _userTransActions,
                          deleteTransaction: _deleteTransaction),
                    ),
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
