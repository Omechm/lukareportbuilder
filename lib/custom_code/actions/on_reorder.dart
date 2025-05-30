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

Future<String> onReorder(
  int? oldIndex,
  int? newIndex,
  List<InspectionFieldsRow>? fields,
) async {
  // Validate inputs
  if (oldIndex == null || newIndex == null || fields == null) {
    throw Exception('Invalid parameters');
  }

  // Adjust newIndex if item is moving forward in the list
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }

  // Reorder the list
  final InspectionFieldsRow item = fields.removeAt(oldIndex);
  fields.insert(newIndex, item);

  // Update the reordered list in the Supabase table "inspection_fields"
  final supabase = SupaFlow.client;

  for (int i = 0; i < fields.length; i++) {
    final response = await supabase
        .from('inspection_fields')
        .update({'ID': i})
        .eq('field_id', fields[i].fieldId)
        .select();
  }

  return 'success';
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
