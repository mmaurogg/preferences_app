import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeData currentTheme;

  // inicializamos con preferencias
  ThemeProvider({
    required bool isDarkMode
  }): this.currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setLightMode(){
     currentTheme = ThemeData.light();
     notifyListeners();
  }

  setDarkMode(){
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}