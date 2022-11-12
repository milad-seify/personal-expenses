import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class CardListTIle extends StatelessWidget {
  const CardListTIle({
    Key? key,
    required this.userTransActionsList,
    required this.deleteTransaction,
    required this.index,
  }) : super(key: key);

  final List<Transaction> userTransActionsList;
  final Function deleteTransaction;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[100],
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 5.0),
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
          DateFormat.yMMMEd().add_jm().format(userTransActionsList[index].date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                onPressed: () =>
                    deleteTransaction(userTransActionsList[index].id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    deleteTransaction(userTransActionsList[index].id),
              ),
      ),
    );
  }
}
