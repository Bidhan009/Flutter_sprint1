import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,

    // Background
    scaffoldBackgroundColor: const Color(0xFF0A0A12),

    // Font family (must match pubspec.yaml)
    fontFamily: 'OpenSans',

    // Color scheme
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1F1F3A), // Deep gaming blue
      secondary: Color(0xFFFF3D71),
      surface: Color(0xFF1A1A2E),
      error: Color(0xFFFF4C4C),
    ),

    // AppBar styling
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F3A),
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
    ),

    // Text styles
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white60),
    ),

    // Button styling
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF3D71), // Neon action button
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

// Card styling
//     cardTheme: CardTheme(
//       color: const Color(0xFF1A1A2E),
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//     ),
//   );
// }
