/*
* Esta clase sirve para que metodos y porpiedades sean estaticos y sea como un singleton
* - Esto no es un gestor de estado, es solo para guardar las preferencias en el dispositivos }
* llaves o pares de valores, para gestionar los estados e hace otra clase
* y se implementa otro paquete: provider 6.0.3 (el gestor es ThemeProvider)
* - necesito mantener la instancia d elas preferencias (se pueden consultar de forma asincrona
* - los build no pueden hacer la inicializacion de esto por que son sincronos para ello:
* 1. Puedo hacer el main asincrono, para poder llamar la inicializacion de las preferencias
* 2. inicializamos y enlazamos los wdgets antes de continuar, usamos WidgetFlutterBinding
*
* - para usarlo:
* 1. regresar a al settin screern: importamos las preferencias y reemplazamos los valores con los de esta clase
* */

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static late SharedPreferences _prefs;

  //propiedades globales (expuestas a travez de setter y getter)
  static String _name = '';
  static bool _isDarkMode = false;
  static int _gender = 1;

  // el constructor debe regresar la instancia (no puee regresar un future
  static Future <void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // getter y setter
  static String get name {
    //usamos el metodo del paquete
    return _prefs.getString('name') ?? _name;
  }

  static set name (String name ){
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode (bool value ){
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender (int value ){
    _gender = value;
    _prefs.setInt('gender', value);
  }

}