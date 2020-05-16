import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarmonitoring/components/begin_button.dart';
import 'package:sugarmonitoring/components/custom_appbar.dart';
import 'package:sugarmonitoring/components/graph_itself_lol.dart';
import 'package:sugarmonitoring/components/nfc_screen.dart';
import 'package:sugarmonitoring/components/sugar_graph.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}

class HomeScreenState extends State<HomeScreen> {
  bool _isFreshStart;
  List<SugarGraphEntry> _history;

  @override
  void initState() {
    super.initState();
    _isFreshStart = true;
    _history = List();
  }

  @override
  Widget build(BuildContext context) {
    var body = _isFreshStart ? BeginButton(scanCallback: () {toggleIsFreshStart();}) : SugarGraph(history: _history,);
    return Scaffold(
      appBar: CustomAppbar(
        height: 56,
      ),
      body: Center(
        child: body,
      ),
      floatingActionButton: !_isFreshStart ? _actionButton() : null,
    );
  }

  void toggleIsFreshStart() {
    _isFreshStart = !_isFreshStart;
  }

  _actionButton() {
    return FloatingActionButton(
      onPressed: () {
        _showDialog();
      },
      child: Icon(
          Icons.add
      ),
    );
  }

  _showDialog() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          var sugarTextController = TextEditingController();
          var dateTextController = TextEditingController()..text = DateTime.now().toString();
          return AlertDialog(
            content: Column(
              children: <Widget>[
                TextField(
                  controller: sugarTextController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Sugar level",
                      hintText: "eg. 200"
                  ),
                ),
                TextField(
                  controller: dateTextController,
                  autofocus: false,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Date",
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('ADD'),
                  onPressed: () {
                    setState(() {
                      _history.add(
                          SugarGraphEntry(
                              DateTime.parse(dateTextController.text),
                              int.parse(sugarTextController.text)
                          )
                      );
                    });
                    Navigator.pop(context);
                  })
            ],
          );
        }
    );
  }
}

