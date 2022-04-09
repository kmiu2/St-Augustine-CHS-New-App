import 'package:flutter/material.dart';

/// This class holds all the styling for the app.
class Styles {
  /// Default height of 72.0
  static const double appBarHeight = 72.0;

  /// #8D1230
  static const Color primary = Color(0xff8D1230);

  /// #D8AE1A
  static const Color secondary = Color(0xffD8AE1A);

  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color transparent = Color(0x00000000);

  /// #C4C4C4
  static const Color grey = Color(0xffC4C4C4);

  /// Default font size for the app. Defaults to 14.0.
  static const double fontSizeNormal = 14.0;

  /// Default font for titles. Defaults to Raleway.
  static const String fontFamilyTitles = 'Raleway';

  /// Default font for text. Defaults to Source Sans Pro.
  static const String fontFamilyNormal = 'SourceSansPro';

  /// Font size 24.0, font family Raleway, font weight 800, color white.
  static const headerMainText = TextStyle(
      fontSize: 24,
      fontFamily: fontFamilyTitles,
      fontWeight: FontWeight.w800,
      color: Colors.white);

  /// Font size 14.0, font family Source Sans Pro, font weight normal, color white.
  static const headerSubText = TextStyle(
      fontSize: fontSizeNormal,
      fontFamily: fontFamilyNormal,
      fontWeight: FontWeight.normal,
      color: Colors.white);

  /// Color primary, spreadRadius 0, blurRadius 5, offset 0 0.
  static final headerBoxShadow = [
    const BoxShadow(
      color: Styles.primary,
      spreadRadius: 0,
      blurRadius: 5,
      offset: Offset.zero,
    )
  ];

  /// Font size 18.0, font family Raleway, font weight bold, color primary.
  static const normalMainText = TextStyle(
      fontSize: 18,
      fontFamily: fontFamilyTitles,
      fontWeight: FontWeight.bold,
      color: primary);

  /// Font size 14.0, font family Source Sans Pro, font weight bold, color primary.
  static const normalSubText = TextStyle(
      fontSize: fontSizeNormal,
      fontFamily: fontFamilyNormal,
      fontWeight: FontWeight.bold,
      color: primary);

  /// Font size 14.0, font family Source Sans Pro, font weight normal, color primary.
  static const normalText = TextStyle(
      fontSize: fontSizeNormal,
      fontFamily: fontFamilyNormal,
      fontWeight: FontWeight.normal,
      color: primary);

  /// Font size 14.0, font family Source Sans Pro, font weight normal, color primary.
  static const urlText = TextStyle(
      fontSize: fontSizeNormal,
      fontFamily: fontFamilyNormal,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.underline,
      color: secondary);

  /// Color RGBO 0 0 0 0.3, spreadRadius 0, blurRadius 10, offset 0 2.
  static final normalBoxShadow = [
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.3),
      spreadRadius: 0,
      blurRadius: 10,
      offset: Offset(0, 2),
    )
  ];

  /// Main border radius value of 16.0
  static const mainBorderRadiusValue = 16.0;

  /// Main border radius. Default is all corners circular of 16.0
  static const mainBorderRadius =
      BorderRadius.all(Radius.circular(mainBorderRadiusValue));

  /// Main outside padding value of 24.0
  static const double mainOutsidePadding = 24.0;

  /// Main vertical padding. Default is 16.0
  static const double mainVerticalPadding = 16.0;

  /// Main spacing between widgets. Default is 20.0
  static const double mainSpacing = 20.0;

  /// Main padding inside widgets. Default is 20.0
  static const double mainInsidePadding = 20.0;

  /// Background banner depth. Default is 0.5
  static const double backgroundBannerDepth = 0.5;

  /// 200.0
  static const double featuredCafeItemHeight = 200.0;

  /// 150.0
  static const double pictureContainerHeight = 150.0;
}

/// Use this method to determine if the app should render the UI for a tablet.
/// Uses a breakpoint of 600.
bool useTabletLayout(BuildContext context) {
  return MediaQuery.of(context).size.width > 600;
}
