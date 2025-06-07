// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF105DFB);
  late Color secondary = const Color(0xFF8AC7FF);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFE0E3E7);
  late Color primaryText = const Color(0xFF12151C);
  late Color secondaryText = const Color(0xFF5A5C60);
  late Color primaryBackground = const Color(0xFFF6F6F6);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0x4C105DFB);
  late Color accent2 = const Color(0x4C8AC7FF);
  late Color accent3 = const Color(0x4CEE8B60);
  late Color accent4 = const Color(0xB3FFFFFF);
  late Color success = const Color(0xFF02CA79);
  late Color warning = const Color(0xFFC96F46);
  late Color error = const Color(0xFFE65454);
  late Color info = const Color(0xFFFFFFFF);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Geist Font Family';
  bool get displayLargeIsCustom => true;
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 60.0,
      );
  String get displayMediumFamily => 'Geist Font Family';
  bool get displayMediumIsCustom => true;
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Geist Font Family';
  bool get displaySmallIsCustom => true;
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineLargeFamily => 'Geist Font Family';
  bool get headlineLargeIsCustom => true;
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Geist Font Family';
  bool get headlineMediumIsCustom => true;
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get headlineSmallFamily => 'Geist Font Family';
  bool get headlineSmallIsCustom => true;
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Geist Font Family';
  bool get titleLargeIsCustom => true;
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
      );
  String get titleMediumFamily => 'Geist Font Family';
  bool get titleMediumIsCustom => true;
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 10.0,
      );
  String get titleSmallFamily => 'Geist Font Family';
  bool get titleSmallIsCustom => true;
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 8.0,
      );
  String get labelLargeFamily => 'Geist Font Family';
  bool get labelLargeIsCustom => true;
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 10.0,
      );
  String get labelMediumFamily => 'Geist Font Family';
  bool get labelMediumIsCustom => true;
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 10.0,
      );
  String get labelSmallFamily => 'Geist Font Family';
  bool get labelSmallIsCustom => true;
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Geist Font Family';
  bool get bodyLargeIsCustom => true;
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.primaryText,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Geist Font Family';
  bool get bodyMediumIsCustom => true;
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Geist Font Family';
  bool get bodySmallIsCustom => true;
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'Geist Font Family',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        fontStyle: FontStyle.italic,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
