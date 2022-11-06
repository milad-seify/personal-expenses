import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction(this.addNewTransaction, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    if (_amountController.text == null) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        // ignore: non_constant_identifier_names
        .then((PickDate) {
      if (PickDate == null) {
        return;
      }
      setState(() {
        _selectedDate = PickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange[300],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'title',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(width: 5.0, color: Colors.red),
                  ),
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData,
                // autofocus: true,
              ),
              const Divider(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'amount',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 5.0, color: Colors.cyan),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData,

                //IOS use : TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(
                height: 60.0,
                child: Row(
                  children: <Widget>[
                    Text(_selectedDate == null
                        ? 'Not Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                    const SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: _presentDatePicker,
                      child: const Text('Choose Date'),
                    )
                  ],
                ),
              ),
              TextButton(
                  onPressed: _submitData,
                  style: TextButton.styleFrom(
                    elevation: 5.0,
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.yellow),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
