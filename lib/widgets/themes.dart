import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
        primarySwatch: Colors.deepOrange,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonTheme: ButtonThemeData(
          buttonColor: darkBluishColor,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkBluishColor,
        ),
        appBarTheme: AppBarTheme(
          color: darkBluishColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        fontFamily: GoogleFonts.poppins()
            .fontFamily, // Google font imported from pub.dev
      );

  static ThemeData darkTheme() => ThemeData(
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        buttonTheme: ButtonThemeData(
          buttonColor: darkBluishColor,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightBluishColor,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );

  // Colors
  static Color creamColor = const Color.fromARGB(129, 238, 231, 231);
  static Color darkCreamColor = Vx.gray800;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo400;
}
