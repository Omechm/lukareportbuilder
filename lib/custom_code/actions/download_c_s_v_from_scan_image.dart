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

Future downloadCSVFromScanImage(
  List<DtReusedImageScanStruct>? dataList, // Adjusted for new schema
  String filename,
  String title,
) async {
  if (dataList == null || dataList.isEmpty) return;

  if (!filename.toLowerCase().endsWith('.csv')) {
    filename += '.csv';
  }

  List<String> csvRows = [];

  // Title and spacing
  csvRows.add(title);
  csvRows.add('');

  // CSV headers
  List<String> headers = [
    'CSO',
    'Location',
    'Report Date',
    'Image Original Date',
    'Field Name'
  ];
  csvRows.add(headers.join(','));

  // Data rows
  for (var item in dataList) {
    csvRows.add([
      item.cso,
      item.location,
      item.reportdate,
      item.imageoriginaldate,
      item.fieldname,
    ].join(','));
  }

  String csvData = csvRows.join('\n');
  final bytes = utf8.encode(csvData);
  final blob = html.Blob([bytes], 'text/csv');
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", filename)
    ..click();
  html.Url.revokeObjectUrl(url);
}
