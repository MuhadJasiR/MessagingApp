import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontSize {
  static const small = 12.0;
  static const standard = 14.0;
  static const standardUp = 16.0;
  static const medium = 20.0;
  static const large = 28.0;
}

class DefaultColors {
  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;
  static Color greyColor50 = Colors.grey.shade50;
  static const Color greyColor100 = Color.fromARGB(255, 237, 237, 237);
  static const Color whiteColor = Colors.white;
  static Color greenColor100 = Colors.green.shade100;
  static const Color greenColor = Colors.green;
  static const Color redColor = Colors.red;
  static const Color yellowColor = Colors.yellow;
  static const Color orangeColor = Colors.orange;
  static Color blueColor100 = Colors.blue.shade100;
  static Color blueColor50 = Colors.blue.shade50;
  static Color blueColor = Colors.blue;
  //------------------------------------//
  static const Color greyText = Color(0xFFB3B9C9);
  static const Color whiteText = Color(0xFFFFFFFF);
  static const Color senderMessage = Color(0xFF7A8194);
  static const Color receiverMessage = Color(0xFF373E4E);
  static const Color sentMessageInput = Color(0xFF3D4354);
  static const Color messageListInput = Color(0xFF292F3F);
  static const Color buttonColor = Color(0xFF7A8194);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xFF1B202D),
        textTheme: TextTheme(
            titleMedium: GoogleFonts.alegreyaSans(),
            titleLarge: GoogleFonts.alegreyaSans(
                fontSize: FontSize.large, color: Colors.white),
            bodySmall: GoogleFonts.alegreyaSans(
                fontSize: FontSize.standardUp, color: Colors.white),
            bodyMedium: GoogleFonts.alegreyaSans(
                fontSize: FontSize.standard, color: Colors.white),
            bodyLarge: GoogleFonts.alegreyaSans(
                fontSize: FontSize.standardUp, color: Colors.white)));
  }
}
