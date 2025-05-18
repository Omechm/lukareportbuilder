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

import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImageWidget extends StatefulWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = 'cover',
    this.borderRadius = 8.0,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final String fit; // Accepts: 'cover', 'contain', etc.
  final double borderRadius;

  @override
  State<CachedNetworkImageWidget> createState() =>
      _CachedNetworkImageWidgetState();
}

class _CachedNetworkImageWidgetState extends State<CachedNetworkImageWidget> {
  BoxFit _getBoxFit(String fitString) {
    switch (fitString) {
      case 'contain':
        return BoxFit.contain;
      case 'fill':
        return BoxFit.fill;
      case 'fitWidth':
        return BoxFit.fitWidth;
      case 'fitHeight':
        return BoxFit.fitHeight;
      case 'none':
        return BoxFit.none;
      case 'scaleDown':
        return BoxFit.scaleDown;
      case 'cover':
      default:
        return BoxFit.cover;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: CachedNetworkImage(
        imageUrl: widget.imageUrl,
        width: widget.width,
        height: widget.height,
        fit: _getBoxFit(widget.fit),
        placeholder: (context, url) => Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          color: Colors.grey[200],
          child: const CircularProgressIndicator(strokeWidth: 2),
        ),
        errorWidget: (context, url, error) => Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, size: 40),
        ),
      ),
    );
  }
}
