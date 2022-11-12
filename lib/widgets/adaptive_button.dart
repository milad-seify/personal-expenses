import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  const AdaptiveFlatButton(
      {super.key, required this.title, required this.handler});
  final String title;
  final VoidCallback handler;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Colors.blue,
            onPressed: handler,
            child: Text(title),
          )
        : ElevatedButton(
            onPressed: handler,
            child: Text(
              title,
              //style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
