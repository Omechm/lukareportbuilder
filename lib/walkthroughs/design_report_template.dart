import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walk_through_widget.dart';

// Focus widget keys for this walkthrough
final buttonM6yuaqyb = GlobalKey();
final column2p1u2gpn = GlobalKey();
final iconButtonX5sjgwxk = GlobalKey();
final columnLu5xoo3c = GlobalKey();
final columnX23r94c5 = GlobalKey();
final column14x3wzgz = GlobalKey();
final column8u3n7yy6 = GlobalKey();
final buttonWafcq2i4 = GlobalKey();
final buttonE8eulk0w = GlobalKey();
final buttonVsecnsfl = GlobalKey();

/// Design Report Template
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: buttonM6yuaqyb,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'Click the CREATE A NEW REPORT TEMPLATE button to start',
              title: 'Step 1',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: column2p1u2gpn,
        enableOverlayTab: true,
        alignSkip: Alignment.topCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description: 'Type in  a new REPORT TITLE in the text box',
              title: 'Step 2',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: iconButtonX5sjgwxk,
        enableOverlayTab: true,
        alignSkip: Alignment.topCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description: 'Click the PLUS button to set the Report Title',
              title: 'Step 3',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: columnLu5xoo3c,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'Here you have to provide a FIELD NAME for the report.',
              title: 'Step 4',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: columnX23r94c5,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'Select FIELD TYPE to specify the expected input type (e.g., Text, Number, Picture, etc.).',
              title: 'Step 5',
            ),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: column14x3wzgz,
        enableOverlayTab: true,
        alignSkip: Alignment.topCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'If you selected CHOICE filed as Field type, you have to add the choice options by adding as many as required using the text input for choice name and the add button to Add the option.',
              title: 'Step 6',
            ),
          ),
        ],
      ),

      /// Step 7
      TargetFocus(
        keyTarget: column8u3n7yy6,
        enableOverlayTab: true,
        alignSkip: Alignment.topCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'Toggle the switch to \"Filled\" to mark the field as required.',
              title: 'Step 7',
            ),
          ),
        ],
      ),

      /// Step 8
      TargetFocus(
        keyTarget: buttonWafcq2i4,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'Click the Add Field button to create the first report field, then repeat steps 2 to 8 to add additional fields as needed.',
              title: 'Step 8',
            ),
          ),
        ],
      ),

      /// Step 9
      TargetFocus(
        keyTarget: buttonE8eulk0w,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'Click the SAVE TEMPLATE button to save the template',
              title: 'Step 9',
            ),
          ),
        ],
      ),

      /// Step 10
      TargetFocus(
        keyTarget: buttonVsecnsfl,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkThroughWidget(
              description:
                  'Click the PUBLISH button to save and make the template available for use.',
              title: 'Step 10',
            ),
          ),
        ],
      ),
    ];
