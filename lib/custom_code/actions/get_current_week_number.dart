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

Future<int> getCurrentWeekNumber() async {
  // Get the current date
  DateTime now = DateTime.now();

  // Get the first day of the year
  DateTime firstDayOfYear = DateTime(now.year, 1, 1);

  // Calculate the number of days between the first day of the year and now
  int daysDifference = now.difference(firstDayOfYear).inDays;

  // Calculate the current week number
  int weekNumber = (daysDifference / 7).ceil();

  return weekNumber;
}
