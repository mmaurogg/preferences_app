import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      // esto pone el menu desplegable lateral
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('is Darkmode: ${Preferences.isDarkMode}'),
          Divider(),
          Text('Género: ${Preferences.gender == 1 ? 'Hombre' : 'Mujer' }'),
          Divider(),
          Text('Nombre de usuario: ${Preferences.name}'),
          Divider(),
        ],
      )
    );
  }
}
