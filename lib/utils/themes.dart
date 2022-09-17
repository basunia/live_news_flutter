import 'package:flutter/material.dart';

const Map<TargetPlatform, PageTransitionsBuilder> _defaultBuilders =
    <TargetPlatform, PageTransitionsBuilder>{
  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
};

class ColorsLight {
  static ThemeData get themeData => ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xff4692CE),
          selectionColor: Color(0xff4692CE),
          selectionHandleColor: Color(0xff4692CE),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xFFDA3030),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          headline4: TextStyle(
            color: Color(0xFFDA3030),
            fontSize: 14,
          ),
          headline3: TextStyle(
            color: Color(0xFFDA3030),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle:
                MaterialStateProperty.all(TextStyle(color: Color(0xFFDA3030))),
            overlayColor: MaterialStateProperty.all(Color(0xffDAE4ED)),
            backgroundColor: MaterialStateProperty.all(Color(0xffCBE8FE)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFDA3030),
        ),
        // buttonColor: Color(0xffCBE8FE),
        canvasColor: const Color(0xffECF0F3),
        primaryColor: Color(0xFFDA3030),
        cardColor: Colors.white,
        highlightColor: const Color(0xffF5F5F5),
        dialogBackgroundColor: Color(0xffFFFFFF),
        backgroundColor: const Color(0xff333333),
        primarySwatch: Colors.red,
        colorScheme: const ColorScheme.light(secondary: Color(0xFFD64A4A)),
        pageTransitionsTheme:
            const PageTransitionsTheme(builders: _defaultBuilders),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFFFFFFFF),
          unselectedItemColor: Color(0xFFE1ECF5),
        ),
      );
}

class ColorsDark {
  static ThemeData get themeData => ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xff4692CE),
          selectionColor: Color(0xff4692CE),
          selectionHandleColor: Color(0xff4692CE),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          headline4: TextStyle(
            color: Color(0xff4692CE),
            fontSize: 14,
          ),
          headline3: TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Color(0xffDAE4ED)),
            backgroundColor: MaterialStateProperty.all(Color(0xff424242)),
          ),
        ),
        // buttonColor: Color(0xff424242),
        primaryColor: Colors.grey,
        canvasColor: Colors.black,
        backgroundColor: Color(0xffD0D0D0),
        cardColor: Color(0xff2C2C2C),
        dialogBackgroundColor: Color(0xff424242),
        highlightColor: Color(0xff141414),
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(secondary: Color(0xff4692CE)),
        pageTransitionsTheme:
            const PageTransitionsTheme(builders: _defaultBuilders),
      );
}
