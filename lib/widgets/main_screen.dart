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
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar =
        AppBar(title: const Text('Personal Expenses'), actions: <Widget>[
      IconButton(
          onPressed: () => _startAddTransaction(context),
          icon: const Icon(Icons.add, color: Colors.tealAccent))
    ]);
    final transactionList = SizedBox(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(
          userTransActionsList: _userTransActions,
          deleteTransaction: _deleteTransaction),
    );
    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (isLandScape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('ChartBar'),
                    Switch(
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
                    appBar: appBar,
                    recentTransactions: _recentTransactions,
                    height: 0.3),
              if (!isLandScape) transactionList,
              if (isLandScape)
                _checkChart
                    ? ChartView(
                        appBar: appBar,
                        recentTransactions: _recentTransactions,
                        height: 0.7,
                      )
                    : transactionList,
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
    return SizedBox(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            height,
        child: Chart(recentTransactions: _recentTransactions));
  }
}
