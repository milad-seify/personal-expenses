import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Expenses'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5.0,
                  color: Colors.amber,
                  child: Text(
                    'CHART',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
