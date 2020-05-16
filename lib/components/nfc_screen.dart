import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarmonitoring/components/custom_appbar.dart';

class NfcScreen extends StatelessWidget {
  final Function() scanCallback;

  const NfcScreen({Key key, @required this.scanCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(height: 56, ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 25),
            child: Text(
              "Please put your device close to your sensor",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                iconSize: 255,
                onPressed: () {
                  scanCallback();
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.nfc,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}