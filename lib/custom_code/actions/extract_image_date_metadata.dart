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

// Custom action name: ExtractImageDateMetadata
Future<DateTime?> extractImageDateMetadata(String imageUrl) async {
  try {
    // Fetch the image data over HTTP
    http.Response response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      Uint8List imageData = response.bodyBytes;

      // Parse the EXIF data from the image
      final Map<String, IfdTag>? exifData = await readExifFromBytes(imageData);
      if (exifData == null || exifData.isEmpty) {
        return null; // No EXIF data found, return null
      }

      // Extract the date from EXIF data using the 'Image DateTime' tag
      final dateTag = exifData['Image DateTime']?.toString();
      if (dateTag != null) {
        // Assuming the date is in 'YYYY:MM:DD HH:MM:SS' format
        return DateFormat('yyyy:MM:dd HH:mm:ss').parse(dateTag);
      } else {
        return null; // No date found in EXIF data, return null
      }
    } else {
      return null; // Failed to fetch the image, return null
    }
  } catch (e) {
    return null; // Error during fetching or processing, return null
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
