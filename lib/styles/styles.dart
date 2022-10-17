import 'package:flutter/material.dart';

class Styles {
  static const COLOR = Colors.grey;
  static const SCAFFOLDCOLOR = Colors.grey;

  static final CARDSHAPE = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );

  static final REGULARCONTAINERBR = BorderRadius.circular(10);

  static final LIGHTTHEMEDATA = ThemeData(
    primarySwatch: Styles.COLOR,
    useMaterial3: true,
    scaffoldBackgroundColor: SCAFFOLDCOLOR.shade100,
    appBarTheme: AppBarTheme(
      foregroundColor: Styles.COLOR.shade100,
      backgroundColor: Styles.COLOR.shade100,
      surfaceTintColor: Styles.COLOR.shade100,
      elevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white.withOpacity(0.8),
      elevation: 10,
      shape: Styles.CARDSHAPE,
    ),
  );
}
