import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransActionsList;
  final ScrollController _firstController = ScrollController();
  final Function deleteTransaction;
  TransactionList(
      {super.key,
      required this.userTransActionsList,
      required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return userTransActionsList.isEmpty
        ? LayoutBuilder(builder: (ctx, constraint) {
            return Column(
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
                  height: constraint.maxHeight * 0.6,
                  //fit: BoxFit.contain,
                ),
              ],
            );
          })
        : SizedBox(
            height: 400,
            child: Scrollbar(
              controller: _firstController,
              thickness: 5.0,
              // thumbVisibility: true,
              child: ListView.builder(
                controller: _firstController,
                //reverse: true,
                itemCount: userTransActionsList.length,
                itemBuilder: (
                  context,
                  index,
                ) =>
                    TransactionItem(
                  userTransAction: userTransActionsList[index],
                  deleteTransaction: deleteTransaction,
                ),
              ),
            ),
          );
  }
}
