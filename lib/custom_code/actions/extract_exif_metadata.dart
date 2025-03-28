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

import 'package:http/http.dart' as http;
import 'package:exif/exif.dart';
import 'dart:typed_data';

// Custom action name: ExtractExifMetadata
Future<String> extractExifMetadata(String imageUrl) async {
  try {
    // Fetch the image data over HTTP
    http.Response response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      Uint8List imageData = response.bodyBytes;

      // Parse the EXIF data from the image
      final Map<String, IfdTag>? exifData = await readExifFromBytes(imageData);
      if (exifData == null || exifData.isEmpty) {
        return "No EXIF data found.";
      }

      // Collecting all EXIF data into a string to return
      StringBuffer buffer = StringBuffer("EXIF Data:\n");
      for (var entry in exifData.entries) {
        buffer.writeln('${entry.key}: ${entry.value}');
      }

      return buffer.toString();
    } else {
      return "Failed to fetch the image data. Status code: ${response.statusCode}";
    }
  } catch (e) {
    return "Error fetching or processing the image: $e";
  }
}
