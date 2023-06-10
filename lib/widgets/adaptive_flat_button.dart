import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdaptiveFlatButton extends StatelessWidget {
  late final String text;
  late Function _presentDatePicker;
  AdaptiveFlatButton(this.text, this._presentDatePicker);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: () => _presentDatePicker(),
            child: Text(
              'Choose Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        : TextButton(
            onPressed: () => _presentDatePicker(),
            child: Text(
              'Choose Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: TextButton.styleFrom(
                iconColor: Theme.of(context).primaryColor));
  }
}
