import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarmonitoring/components/graph_itself_lol.dart';
import 'package:sugarmonitoring/components/sugar_graph.dart';
import 'package:sugarmonitoring/components/watcher_screen.dart';

class AwesomeDrawer extends StatelessWidget {
  final SugarGraphEntry lastMeasurement;
  final List<SugarGraphEntry> history;

  const AwesomeDrawer({Key key, this.lastMeasurement, this.history})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var measurementStr = lastMeasurement != null
        ? lastMeasurement.sugarLevel.toString() +
            " at " +
            lastMeasurement.timeStamp.toIso8601String()
        : "";

    return Drawer(
        child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("John Doe"),
          accountEmail: Text(measurementStr),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "J",
              style: TextStyle(fontSize: 40, color: Colors.blue),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WatcherScreen()));
                },
              ),
            )
          ],
        ),
        ListTile(
          title: Text('My history'),
          leading: Icon(
            Icons.map,
            color: Colors.blueGrey,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SugarGraph(
                          history: history,
                        )));
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('My Watchlist'),
          leading: Icon(
            Icons.view_list,
            color: Colors.blueGrey,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WatcherScreen()));
            Navigator.pop(context);
          },
        ),
        const Divider(
          color: Colors.blueGrey,
          height: 3,
          thickness: 0,
          indent: 5,
          endIndent: 0,
        ),
        ListTile(
          title: Text('Settings'),
          leading: Icon(
            Icons.settings,
            color: Colors.blueGrey,
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Help'),
          leading: Icon(
            Icons.help_outline,
            color: Colors.blueGrey,
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Send Feedback'),
          leading: Icon(
            Icons.send,
            color: Colors.blueGrey,
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
