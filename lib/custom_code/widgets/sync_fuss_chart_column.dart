// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class SyncFussChartColumn extends StatefulWidget {
  const SyncFussChartColumn({
    super.key,
    this.width,
    this.height,
    required this.chartData,
    required this.yMaxValue,
    required this.yMinValue,
    required this.yInterval,
  });

  final double? width;
  final double? height;
  final List<NonCompliantLocationCountStruct> chartData;
  final double? yMaxValue;
  final double? yMinValue;
  final double? yInterval;
  @override
  State<SyncFussChartColumn> createState() => _SyncFussChartColumnState();
}

class _SyncFussChartColumnState extends State<SyncFussChartColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
          title:
              ChartTitle(text: 'Deployment of All non compliance by location'),
          legend: Legend(isVisible: true),
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
              minimum: widget.yMinValue ?? 0,
              maximum: widget.yMaxValue ?? 200,
              interval: widget.yInterval ?? 10),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<NonCompliantLocationCountStruct, String>>[
            BarSeries<NonCompliantLocationCountStruct, String>(
                dataSource: widget.chartData,
                xValueMapper: (NonCompliantLocationCountStruct data, _) =>
                    data.location,
                yValueMapper: (NonCompliantLocationCountStruct data, _) =>
                    data.count,
                // Width of the bars
                width: 0.6,
                // Spacing between the bars
                spacing: 0.3,
                sortingOrder: SortingOrder.ascending,
                sortFieldValueMapper:
                    (NonCompliantLocationCountStruct data, _) => data.count,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                name: 'No. of non compliance',
                color: Color.fromARGB(255, 87, 125, 216),
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]),
    );
  }
}
