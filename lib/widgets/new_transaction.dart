import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/adaptive_button.dart';

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
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final txtBtn = TextButton(
        onPressed: _submitData,
        style: TextButton.styleFrom(
          elevation: 5.0,
          backgroundColor: Colors.purple,
        ),
        child: const Text(
          'Add Transaction',
          style: TextStyle(color: Colors.yellow),
        ));
    return SingleChildScrollView(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(
              top: 5.0,
              left: 5.0,
              right: 5.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //CupertinoTextField(),
              textField(
                  input: _titleController,
                  labelText: '  title',
                  keyboardType: TextInputType.name),
              const Divider(
                height: 5.0,
              ),
              textField(
                  input: _amountController,
                  labelText: '  amount',
                  keyboardType: TextInputType.number),
              SizedBox(
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _selectedDate == null
                          ? 'Not Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    AdaptiveFlatButton(
                        title: "Choose Data", handler: _presentDatePicker),
                    const SizedBox(
                      width: 40.0,
                    ),
                    if (isLandScape) txtBtn,
                  ],
                ),
              ),
              if (!isLandScape) txtBtn,
            ],
          ),
        ),
      ),
    );
  }

  TextField textField(
      {required String labelText,
      required TextEditingController input,
      required TextInputType keyboardType}) {
    return TextField(
      decoration: InputDecoration(
        hintText: labelText,
        // labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 5.0, color: Colors.deepOrangeAccent),
          borderRadius: BorderRadius.circular(27.0),
        ),
      ),
      controller: input,
      keyboardType: keyboardType,
      onSubmitted: (_) => _submitData,

      //IOS use : TextInputType.numberWithOptions(decimal: true),
    );
  }
}





  // void _showDialog(Widget child) {
  //   showCupertinoModalPopup<void>(
  //       context: context,
  //       builder: (BuildContext context) => Container(
  //             height: 200,
  //             padding: const EdgeInsets.only(top: 5.0),
  //             margin: EdgeInsets.only(
  //               bottom: MediaQuery.of(context).viewInsets.bottom,
  //             ),
  //             color: CupertinoColors.systemBackground.resolveFrom(context),
  //             child: SafeArea(
  //               top: false,
  //               child: child,
  //             ),
  //           ));
  // }