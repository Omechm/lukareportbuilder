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

class ExecutionPercentageChart extends StatefulWidget {
  const ExecutionPercentageChart({
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
  final List<GetPercentageOfExecutionStruct> chartData;
  final double? yMaxValue;
  final double? yMinValue;
  final double? yInterval;

  @override
  State<ExecutionPercentageChart> createState() =>
      _ExecutionPercentageChartState();
}

class _ExecutionPercentageChartState extends State<ExecutionPercentageChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
        title: ChartTitle(text: 'Execution Percentage by Location'),
        legend: Legend(isVisible: true),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          minimum: widget.yMinValue ?? 0,
          maximum: widget.yMaxValue ?? 100,
          interval: widget.yInterval ?? 10,
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries<GetPercentageOfExecutionStruct, String>>[
          BarSeries<GetPercentageOfExecutionStruct, String>(
            dataSource: widget.chartData,
            xValueMapper: (GetPercentageOfExecutionStruct data, _) =>
                data.clientname,
            yValueMapper: (GetPercentageOfExecutionStruct data, _) =>
                double.parse(data.executionpercentage.toStringAsFixed(1)),
            width: 0.6,
            spacing: 0.3,
            sortingOrder: SortingOrder.ascending,
            sortFieldValueMapper: (GetPercentageOfExecutionStruct data, _) =>
                double.parse(data.executionpercentage.toStringAsFixed(1)),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            name: 'Execution %',
            color: Color.fromARGB(255, 87, 125, 216),
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}
