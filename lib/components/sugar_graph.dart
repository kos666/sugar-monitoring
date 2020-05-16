import 'package:flutter/material.dart';
import 'package:sugarmonitoring/components/graph_itself_lol.dart';


class SugarGraph extends StatelessWidget {

  final List<SugarGraphEntry> history;

  const SugarGraph({Key key, this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: NonzeroBoundMeasureAxis.withData(history),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          "Last check:",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, bottom: 5),
                        child: Text(
                          history.length > 0 ? history.last.sugarLevel.toString() : "",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, bottom: 15),
                        child: Text(
                          history.length > 0 ? history.last.timeStamp.toIso8601String() : "",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}