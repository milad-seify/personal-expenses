import 'dart:io';

import 'package:flutter/cupertino.dart';
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
  final List<Transaction> _userTransActions = [];

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
    final mediaQuery = MediaQuery.of(context);
    final isLandScape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text('Personal Expenses'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _startAddTransaction(context),
                  child: const Icon(CupertinoIcons.add),
                ),
              ],
            ),
          ) as PreferredSizeWidget
        : AppBar(title: const Text('Personal Expenses'), actions: <Widget>[
            IconButton(
              onPressed: () => _startAddTransaction(context),
              icon: const Icon(Icons.add, color: Colors.tealAccent),
            )
          ]);
    final transactionList = SizedBox(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(
          userTransActionsList: _userTransActions,
          deleteTransaction: _deleteTransaction),
    );
    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandScape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ChartBar',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  // use adaptive for platform choose
                  Switch.adaptive(
                      //activeColor: Theme.of(context).accentColor,
                      value: _checkChart,
                      onChanged: (val) {
                        setState(() {
                          _checkChart = val;
                        });
                      }),
                ],
              ),
            if (!isLandScape)
              ChartView(
                  appBar: appBar as AppBar,
                  recentTransactions: _recentTransactions,
                  height: 0.3),
            if (!isLandScape) transactionList,
            if (isLandScape)
              _checkChart
                  ? ChartView(
                      appBar: appBar as AppBar,
                      recentTransactions: _recentTransactions,
                      height: 0.7,
                    )
                  : transactionList,
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar as ObstructingPreferredSizeWidget,
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _startAddTransaction(context),
                    child: const Icon(Icons.add),
                  ));
  }
}

class ChartView extends StatelessWidget {
  const ChartView(
      {Key? key,
      required this.appBar,
      required List<Transaction> recentTransactions,
      required this.height})
      : _recentTransactions = recentTransactions,
        super(key: key);
  final AppBar appBar;
  final List<Transaction> _recentTransactions;
  final double height;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            height,
        child: Chart(recentTransactions: _recentTransactions));
  }
}
