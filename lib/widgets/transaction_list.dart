import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

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
              // thumbVisibility: true,
              thickness: 10.0,
              child: ListView.builder(
                controller: _firstController,
                //reverse: true,
                itemCount: userTransActionsList.length,
                itemBuilder: (
                  context,
                  index,
                ) =>
                    Card(
                  color: Colors.yellow[100],
                  elevation: 7.0,
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
                        //shape: BoxShape.c,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                      child: Text(
                        '\$${userTransActionsList[index].amount < 100 ? userTransActionsList[index].amount.toStringAsFixed(2) : userTransActionsList[index].amount.toStringAsFixed(2).substring(0, 6)}',
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
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () =>
                          deleteTransaction(userTransActionsList[index].id),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
