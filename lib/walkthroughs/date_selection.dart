import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walk_through_widget.dart';

// Focus widget keys for this walkthrough
final columnB0orrnel = GlobalKey();
final rowDka0kd93 = GlobalKey();
final columnW8yg2y3l = GlobalKey();
final rowEhqb3umo = GlobalKey();
final wrapAzmb9lit = GlobalKey();

/// Date Selection
///
/// "Filtering data based on a selected date range, starting from the 'Date From' value."
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: columnB0orrnel,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomLeft,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'Select a date by clicking the Calendar icon in the Date From Selector.',
              title: 'Date From',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: rowDka0kd93,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomLeft,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'You can also change the selected \'Date From\' by clicking the forward and backward navigation arrows',
              title: 'Date From',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: columnW8yg2y3l,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'Select a date by clicking the Calendar icon in the Date To Selector.',
              title: 'Date To',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: rowEhqb3umo,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'You can also change the selected \'Date to\' by clicking the forward and backward navigation arrows',
              title: 'Date To',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: wrapAzmb9lit,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'Click the BLUE magnifying glass to apply the filter or the RED icon to cancel and reset the filter.',
              title: 'Search',
            ),
          ),
        ],
      ),
    ];
