import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

// asincrono, para poder llamar la inicializacion de las preferencias
void main() async {

  // inicializamos y enlazamos los wdgets antes de continuar,
  WidgetsFlutterBinding.ensureInitialized();

  // inicializamos y enlazamos los wdgets antes de continuar
  await Preferences.init();

  // corro el los providers que van a ser de manera global
  runApp(
      MultiProvider(
          providers: [
            //regreso la instancia del tema, necesito saber cual es el modo
            ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode))
          ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );

  }
}
