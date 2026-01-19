import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Islamic Color Palette
  static const Color primaryGreen = Color(0xFF006341);
  static const Color secondaryGold = Color(0xFFD4AF37);
  static const Color lightGreen = Color(0xFF4CAF50);
  static const Color darkGreen = Color(0xFF004D40);
  static const Color creamWhite = Color(0xFFFFF8E7);
  static const Color softBrown = Color(0xFF8D6E63);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: creamWhite,
    colorScheme: ColorScheme.light(
      primary: primaryGreen,
      secondary: secondaryGold,
      surface: Colors.white,
      background: creamWhite,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryGreen,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.amiri(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.amiri(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: primaryGreen,
      ),
      displayMedium: GoogleFonts.amiri(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: primaryGreen,
      ),
      headlineMedium: GoogleFonts.amiri(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: darkGreen,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        color: Colors.black87,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        color: Colors.black87,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: primaryGreen,
      size: 24,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: lightGreen,
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: ColorScheme.dark(
      primary: lightGreen,
      secondary: secondaryGold,
      surface: const Color(0xFF1E1E1E),
      background: const Color(0xFF121212),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.amiri(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.amiri(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: lightGreen,
      ),
      displayMedium: GoogleFonts.amiri(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: lightGreen,
      ),
      headlineMedium: GoogleFonts.amiri(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        color: Colors.white70,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        color: Colors.white70,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xFF1E1E1E),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightGreen,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: lightGreen,
      size: 24,
    ),
  );
}
