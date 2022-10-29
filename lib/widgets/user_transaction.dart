import 'dart:math';

import "package:flutter/material.dart";
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

//this class for manage your transactions
class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(userTransActions: _userTransActions),
      ],
    );
  }
}
