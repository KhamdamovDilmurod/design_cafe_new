import 'dart:ui';

import 'package:flutter/material.dart';

import '../extentions/extensions.dart';

const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF6095FF);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

const kDefaultPadding = 20.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);


class AppColors{
  static Color gray_light = Color(0xFFF0F4FF);
  static Color colorPrimary = Color(0xFFEAF3FC);
  static Color colorPrimaryDark = Color(0xFFD3EAFD);
  static Color borderColor = Color(0xFF83C4FA);
  static Color yellowTransparent =Color(0xFFFFA612);
  static Color yellow = Color(0xFFFFF600);
  static Color background_color = Color(0xFFF9F8FE);
  static Color gray_dark = Color(0xFFD9D9D9);
  static Color gray_dark3 = Color(0xFF777777);
  static Color gray_dark2 = Color(0xFFC9D1DE);
  static Color white = Color(0xFFFFFFFF);
  static Color black = Color(0xFF000000);
  // static Color PRIMARY_COLOR = HexColor.fromHex("#262B31");

  static Color PRIMARY_COLOR = HexColor.fromHex("#6291FD");
  static Color YELLOW_COLOR = HexColor.fromHex("#FCCC28");
  static Color BLACK_COLOR = HexColor.fromHex("#1B1B1B");
  static Color GREY_TEXT_COLOR = HexColor.fromHex("#9098B1");
  static Color GREY_LIGHT_COLOR = HexColor.fromHex("#EBF0FF");
  static Color GREY_COLOR = HexColor.fromHex("#9098B1");
  static Color BACKGROUND_COLOR = HexColor.fromHex("#F9FAFE");
  static Color LIGHT_RED_COLOR = HexColor.fromHex("#E4B8BC");
  static Color RED_COLOR = HexColor.fromHex("#B41D22");
  static Color MOKRI = HexColor.fromHex("#2F3F48");


  static List<Color> RANDOM_COLORS = [
    HexColor.fromHex("#F8A44C"),
    HexColor.fromHex("#53B175"),
    HexColor.fromHex("#D3B0E0"),
    HexColor.fromHex("#CD6ECD"),
    HexColor.fromHex("#B7DFF5"),
    HexColor.fromHex("#FDE598"),
    HexColor.fromHex("#2F3F48"),
  ];

  static Color getRandomColor(int index) {
    return RANDOM_COLORS[index % RANDOM_COLORS.length];
  }
}
