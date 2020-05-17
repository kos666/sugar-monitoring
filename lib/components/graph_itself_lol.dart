import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class NonzeroBoundMeasureAxis extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NonzeroBoundMeasureAxis(this.seriesList, {this.animate});

  factory NonzeroBoundMeasureAxis.withData(List<SugarGraphEntry> data) {
    return new NonzeroBoundMeasureAxis(
      _convertDataToSeries(data),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(seriesList,
        animate: animate,
        // Provide a tickProviderSpec which does NOT require that zero is
        // included.
        primaryMeasureAxis: new charts.NumericAxisSpec(
            tickProviderSpec:
            new charts.BasicNumericTickProviderSpec(zeroBound: false)),
        behaviors: [
          charts.SlidingViewport(),
          charts.PanAndZoomBehavior()
        ],
        domainAxis: charts.DateTimeAxisSpec(
          viewport: charts.DateTimeExtents(
              start: DateTime.now().subtract(Duration(minutes: 10)),
              end: DateTime.now()
          ),
        ));
  }

  static List<charts.Series<SugarGraphEntry, DateTime>> _convertDataToSeries(List<SugarGraphEntry> data) {
    return [
      new charts.Series<SugarGraphEntry, DateTime>(
        id: 'Headcount',
        domainFn: (SugarGraphEntry row, _) => row.timeStamp,
        measureFn: (SugarGraphEntry row, _) => row.sugarLevel,
        data: data,
      )
    ];
  }

  static List<charts.Series<SugarGraphEntry, DateTime>> _createSampleData() {
    final data = [
      new SugarGraphEntry(new DateTime(2017, 9, 25), 106),
//      new MyRow(new DateTime(2017, 9, 26), 108),
//      new MyRow(new DateTime(2017, 9, 27), 106),
//      new MyRow(new DateTime(2017, 9, 28), 109),
//      new MyRow(new DateTime(2017, 9, 29), 111),
//      new MyRow(new DateTime(2017, 9, 30), 115),
//      new MyRow(new DateTime(2017, 10, 01), 125),
//      new MyRow(new DateTime(2017, 10, 02), 133),
//      new MyRow(new DateTime(2017, 10, 03), 127),
//      new MyRow(new DateTime(2017, 10, 04), 131),
//      new MyRow(new DateTime(2017, 10, 05), 123),
    ];

    return [
      new charts.Series<SugarGraphEntry, DateTime>(
        id: 'Headcount',
        domainFn: (SugarGraphEntry row, _) => row.timeStamp,
        measureFn: (SugarGraphEntry row, _) => row.sugarLevel,
        data: data,
      )
    ];
  }
}

class SugarGraphEntry {
  final DateTime timeStamp;
  final int sugarLevel;
  SugarGraphEntry(this.timeStamp, this.sugarLevel);
}