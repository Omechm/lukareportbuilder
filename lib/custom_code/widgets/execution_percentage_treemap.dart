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

import 'package:syncfusion_flutter_treemap/treemap.dart';

class ExecutionPercentageTreemap extends StatefulWidget {
  const ExecutionPercentageTreemap({
    super.key,
    this.width,
    this.height,
    required this.chartData,
  });

  final double? width;
  final double? height;
  final List<GetPercentageOfExecutionStruct> chartData;

  @override
  State<ExecutionPercentageTreemap> createState() =>
      _ExecutionPercentageTreemapState();
}

class _ExecutionPercentageTreemapState
    extends State<ExecutionPercentageTreemap> {
  late List<GetPercentageOfExecutionStruct> _chartData;

  @override
  void initState() {
    super.initState();
    _chartData = widget.chartData;
  }

  @override
  void didUpdateWidget(covariant ExecutionPercentageTreemap oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Compare lists by reference or custom logic
    if (oldWidget.chartData != widget.chartData) {
      setState(() {
        _chartData = widget.chartData;
      });
    }
  }

  Color _getConditionalColor(double value) {
    if (value == 100) {
      return Colors.green;
    } else if (value > 70) {
      return Colors.orange;
    } else if (value > 30) {
      return Colors.yellow[700]!;
    } else if (value > 0) {
      return Colors.red;
    } else {
      return Colors.grey[800]!; // Zero execution
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 400,
      child: SfTreemap(
        dataCount: _chartData.length,
        weightValueMapper: (int index) => _chartData[index].executionpercentage,
        levels: <TreemapLevel>[
          TreemapLevel(
            groupMapper: (int index) =>
                _chartData[index].clientname ?? 'Unknown',
            labelBuilder: (BuildContext context, TreemapTile tile) {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  '${tile.group}\n${tile.weight.toStringAsFixed(1)}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
            tooltipBuilder: (BuildContext context, TreemapTile tile) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Client: ${tile.group}\nExecution: ${tile.weight.toStringAsFixed(1)}%',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
            colorValueMapper: (TreemapTile tile) =>
                _getConditionalColor(tile.weight),
          ),
        ],
      ),
    );
  }
}
