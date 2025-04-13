// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:html' as html;
import 'dart:async';

Future downloadCSVFromAPIData(List<GetPercentageOfExecutionStruct>? dataList,
    String filename, String title // New parameter for title
    ) async {
  if (dataList!.isEmpty) return;

  // Ensure filename has .csv extension
  if (!filename.toLowerCase().endsWith('.csv')) {
    filename += '.csv';
  }

  // Define CSV content
  List<String> csvRows = [];

  // Add title as the first row
  csvRows.add(title);
  csvRows.add(''); // Blank row for separation

  // Define CSV headers
  List<String> headers = ['Location', 'Execution %'];
  csvRows.add(headers.join(',')); // Add header row

  for (var item in dataList) {
    csvRows.add([
      item.clientname, // Ensure these field names match your API response
      item.executionpercentage.toStringAsFixed(1) // Round to 1 decimal place
    ].join(','));
  }

  String csvData = csvRows.join('\n');

  // Trigger file download with correct MIME type
  final bytes = utf8.encode(csvData);
  final blob = html.Blob([bytes], 'text/csv'); // Set correct MIME type
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", filename) // Use dynamic filename
    ..click();
  html.Url.revokeObjectUrl(url);
}
