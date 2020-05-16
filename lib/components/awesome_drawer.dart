import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarmonitoring/components/graph_itself_lol.dart';
import 'package:sugarmonitoring/components/watcher_screen.dart';

class AwesomeDrawer extends StatelessWidget {
  final SugarGraphEntry lastMeasurement;

  const AwesomeDrawer({Key key, this.lastMeasurement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var measurementStr = lastMeasurement != null ?
    lastMeasurement.sugarLevel.toString() + " at " + lastMeasurement.timeStamp.toIso8601String() : "";

    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "John Doe"
            ),
            accountEmail: Text(
                measurementStr
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "J",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue
                ),
              ),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WatcherScreen()));
                  },
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}