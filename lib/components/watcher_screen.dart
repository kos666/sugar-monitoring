import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarmonitoring/components/awesome_drawer.dart';
import 'package:sugarmonitoring/components/custom_appbar.dart';

class WatcherScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppbar(
        title: "Your subscriptions",
        height: 56,
      ),
      drawer: AwesomeDrawer(),
      body: ListView(
        children: <Widget>[
          Subscription(title: "Mother",),
          Subscription(title: "Doc Alex",),
        ],
      ),
    );
  }
}

class SubscriptionsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SubscriptionsListState();
  }
}

class SubscriptionsListState extends State<SubscriptionsList> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class Subscription extends StatelessWidget {
  final String title;

  const Subscription({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
            title
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (String selection) {
            print(selection);
          },
          itemBuilder: (BuildContext ctx) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: "test",
              child: Text("Unsubscribe"),
            )
          ],
          icon: Icon(
              Icons.more_vert
          ),
        )
    );
  }

}