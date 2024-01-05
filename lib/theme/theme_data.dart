// Class to contain the theme pallete
import 'package:flutter/material.dart';

class ThemePallete {
  static List<Color> get lightGradient =>
      const [Color.fromRGBO(12, 29, 77, 1), Color.fromRGBO(33, 78, 204, 1)];
  static List<Color> get darkGradient =>
      const [Color.fromRGBO(0, 0, 0, 1), Color.fromRGBO(41, 41, 41, 1)];
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          actionsIconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.16)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.16)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
        ),
        colorScheme: const ColorScheme.light(
            primaryContainer: Color.fromRGBO(255, 255, 255, 0.08),
            onPrimaryContainer: Colors.white),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.black),
          side: const BorderSide(color: Colors.white),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color.fromRGBO(33, 78, 204, 0.7),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          dividerColor: Color.fromRGBO(255, 255, 255, 0.16),
          dividerHeight: 1,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            insets: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        dividerTheme: const DividerThemeData(
          color: Color.fromRGBO(255, 255, 255, 0.16),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.01),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          enableFeedback: false,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            fontFamily: 'SFPro',
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'SFPro',
            fontSize: 10,
          ),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
          ),
          titleMedium: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.16),
          ),
        ),
      );
  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primaryContainer: Color.fromRGBO(255, 255, 255, 0.08),
          onPrimaryContainer: Colors.white,
        ),
        dividerTheme: const DividerThemeData(
          color: Color.fromRGBO(255, 255, 255, 0.16),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          actionsIconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          dividerColor: Color.fromRGBO(255, 255, 255, 0.16),
          dividerHeight: 1,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            insets: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.16)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.16)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.01),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          enableFeedback: false,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            fontFamily: 'SFPro',
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'SFPro',
            fontSize: 10,
          ),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.16),
          ),
        ),
      );
}
