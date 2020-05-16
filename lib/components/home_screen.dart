import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarmonitoring/api_client/CgmApiClient.dart';
import 'package:sugarmonitoring/components/begin_button.dart';
import 'package:sugarmonitoring/components/custom_appbar.dart';
import 'package:sugarmonitoring/components/graph_itself_lol.dart';
import 'package:sugarmonitoring/components/nfc_screen.dart';
import 'package:sugarmonitoring/components/sugar_graph.dart';
import 'package:unicorndial/unicorndial.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}

class HomeScreenState extends State<HomeScreen> {
  bool _isFreshStart;
  List<SugarGraphEntry> _history;
  CgmApiClient _cgmApiClient;

  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _cgmApiClient = CgmApiClient();
    _isFreshStart = true;
    _history = _cgmApiClient.getSugars();
  }

  @override
  Widget build(BuildContext context) {
    var body = _isFreshStart ? BeginButton(scanCallback: toggleIsFreshStart) : SugarGraph(history: _history,);
    return Scaffold(
      appBar: CustomAppbar(
        height: 56,
      ),
      body: Center(
        child: body,
      ),
      floatingActionButton: !_isFreshStart ? _unicornDialer() : null,
      drawer: Drawer(),
    );
  }

  void toggleIsFreshStart() {
    _isFreshStart = !_isFreshStart;
  }

  _unicornDialer() {
    return UnicornDialer(
      orientation: UnicornOrientation.VERTICAL,
      parentButton: Icon(
          Icons.add
      ),
      parentButtonBackground: Colors.blue,
      childButtons: _getEntryButtons(),
    );
  }

  List<UnicornButton> _getEntryButtons() {
    List<UnicornButton> buttons = [];

    buttons.add(_getButton(_showDialog, Icons.keyboard, "manualButton"));
    buttons.add(_getButton(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NfcScreen(scanCallback: _scanCallback,)));
    }, Icons.nfc, "nfcButton"));

    return buttons;
  }

  _scanCallback() {
    if (_isFreshStart) _isFreshStart = false;
    //todo get data from nfc
    setState(() {
      _history.add(SugarGraphEntry(
        DateTime.now(),
          _getRandomNumber(200, 300)
      ));
    });
  }

  int _getRandomNumber(int min, int max) => min + _random.nextInt(max - min);

  UnicornButton _getButton(Function callback, IconData iconData, String heroTag) {
    return UnicornButton(
      currentButton: FloatingActionButton(
        heroTag: heroTag,
        mini: true,
        onPressed: callback,
        child: Icon(
            iconData
        ),
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

