import 'package:flutter/material.dart';

class AppColors {
  // Basic Colors
   static const Color grey = Color(0xFF9E9E9E); // Grey
  static const Color black = Color(0xFF000000); // Black
  static const Color white = Color(0xFFFFFFFF); // White
  static const Color primaryRed = Color(0xFFFF5069); // Red


  static const Color blue = Color(0xFF2196F3); // Blue
  static const Color deepBlue = Color(0xFF006CAF); // Deep Blue Shade
  static const Color lightSkyBlue = Color(0xFFAEE7FF); // Light Sky Blue Shade
  static const Color lightblue = Color(0xFFC6EEFF); // LightBlue
  static const Color lightred = Color(0xFFFF90A0); // LightRed
  static const Color coralred = Color(0xFFE2473D); // CoralRed
  static const Color softPink = Color(0xFFFFB8B8); // Soft Pink Shade
  static const Color lightpink = Color(0xFFFFD3D3); // LightBlue
  static const Color vividRed = Color(0xFFFC2D2A); // Vivid Red Shade
  static const Color brightRed = Color(0xFFFF2F2E); // Bright Red Shade
  static const Color darkRed = Color(0xFFE40000); //  Red Rejected Shade
  static const Color freshGreen = Color(0xFF6EC551); //  Green completed Shade
  static const Color goldenYellow = Color(0xFFE0BA00); // yellow pending Shade
  static const Color vibrantYellow = Color(0xFFE7D813); //  Yellow goldenmembership Shade
  static const Color skyBlue = Color(0xFF50C2FF); //  Blue platinummembership Shade
  static const Color lightGray = Color(0xFFC8C8C8); //  Gray  silver membership Shade
  static const Color vibrantGreen = Color(0xFF4CE417); //  Green chat active Shade
  static const Color warmOrange = Color(0xFFF2994A); // Warm Orange Shade



  static const Gradient pinkWhiteGradient = LinearGradient(
    colors: [
      Color(0xFFFFFFFF), // White
      Color(0xFFFF90A0), // Pink
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

   static const Gradient blueWhiteGradient = LinearGradient(
    colors: [
      Color(0xFFC6EEFF), // blue
      Color(0xFFFFFFFF), // White
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
}
