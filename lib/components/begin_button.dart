import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarmonitoring/components/nfc_screen.dart';

class BeginButton extends StatelessWidget {
  final Function scanCallback;

  const BeginButton({Key key, @required this.scanCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NfcScreen(scanCallback: scanCallback,)));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: Theme.of(context).primaryColor,
      child: Text(
        "START MONITORING",
        style: TextStyle(
            color: Colors.white
        ),
      ),
    );
  }
}