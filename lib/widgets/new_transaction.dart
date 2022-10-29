import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addNewTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'title '),
              controller: titleController,
              onSubmitted: (_) => _submitData,

              //  autofocus: true,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
              //on IOS use
              // TextInputType.numberWithOptions(decimal: true),
            ),
            TextButton(
                onPressed: _submitData,
                style: TextButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: Colors.purple,
                ),
                child: const Text(
                  'Transaction',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
