import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime? thisMonthStartDateTime() {
  return DateTime(DateTime.now().year, DateTime.now().month - 1, 1);
}

DateTime? addDay(DateTime? date) {
  // create a function to add a day to the argument date and return the date
  if (date != null) {
    return date.add(Duration(days: 1));
  }
  return null;
}

DateTime? currentDateTime() {
  return DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
}

DateTime? subtractDay(DateTime? date) {
  // create a function to subtract a day to the argument date and return the date
  if (date != null) {
    return date.subtract(Duration(days: 1));
  }
  return null;
}

String? allCapsConvertion(String? text) {
  // Create a function to convert Text argument to uppercase
  if (text != null) {
    return text.toUpperCase();
  }
  return null;
}

DateTime? formatStrToDateTime(String? arDateTime) {
  // convert string to datetime yyyy-MM-dd
  if (arDateTime == null) {
    return null;
  }

  try {
    return DateFormat('yyyy-MM-dd').parse(arDateTime);
  } catch (e) {
    return null;
  }
}

DateTime? formatDateTime(DateTime? arDateTime) {
  // Convert Datetime to yyyy-mm-dd
  if (arDateTime == null) {
    return null;
  }

  String formattedDate = DateFormat('yyyy-MM-dd').format(arDateTime);
  return DateTime.parse(formattedDate);
}

String? convertStringToImagePath(String? imgStr) {
  // return imgStr as ImagePath
  if (imgStr == null || imgStr.isEmpty) {
    return null;
  }

  // Add any necessary logic to convert the imgStr to an ImagePath
  // For example, if imgStr is a base64 encoded string, you can decode it and return as ImagePath
  // If imgStr is a URL, you can directly return it as ImagePath

  return imgStr;
}

String? convertSecsToDuration(int? argSeconds) {
  // Create a function to convert Seconds to duration, return duration format
  if (argSeconds == null) {
    return null;
  }

  Duration duration = Duration(seconds: argSeconds);
  String hours = duration.inHours.remainder(24).toString().padLeft(2, '0');
  String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

  return '$hours:$minutes:$seconds';
}

DateTime? last2WeeksDate() {
  // Create a function get last 2 weeks date formatted as yyyy-mm-dd
  final now = DateTime.now();
  final twoWeeksAgo = now.subtract(Duration(days: 14));
  final formatter = DateFormat('yyyy-MM-dd');
  final formattedDate = formatter.format(twoWeeksAgo);
  return DateTime.parse(formattedDate);
}

DateTime? getDate2WeeksFromDate(DateTime? startDate) {
  // Get Date 2 weeks ago from startDate
  if (startDate == null) return null; // Check for null input
  return startDate.subtract(Duration(days: 14)); // Subtract 14 days
}

String? convertYouTubeShortUrl(String url) {
  final uri = Uri.parse(url);
  String videoId = '';

  if (uri.host == 'youtu.be' && uri.pathSegments.isNotEmpty) {
    videoId = uri.pathSegments[0];
  } else if (uri.host.contains('youtube.com') &&
      uri.queryParameters.containsKey('v')) {
    videoId = uri.queryParameters['v']!;
  }

  if (videoId.isNotEmpty) {
    return 'https://www.youtube.com/embed/$videoId?controls=1&autoplay=1&mute=0&rel=0&modestbranding=1';
  }

  return url;
}
