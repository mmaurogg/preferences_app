import 'package:flutter/material.dart';
import 'package:preferences_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {

  static const String routeName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isDarkmode = false;
  int gender = 1;
  String name = 'Pepito';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: SideMenu(),

      body: Padding(
        padding:  const EdgeInsets.all(8.0),
      // se elige este para caja de texto (para que quede bloqueada por el teclado)
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Ajustes', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
              const Divider(),

              SwitchListTile.adaptive(
                  value: isDarkmode,
                  title: Text('Darkmode'),
                  onChanged: (value) {
                    isDarkmode = value;
                    setState(() {});
                  }),
              const Divider(),

              //Es importante indicar con que dato trabajan
              RadioListTile<int>(
                  value: 1,
                  groupValue: gender,
                  title: Text('Masculino'),
                  onChanged: (value) {
                    // si el valor viene nulo doy valor por defecto
                    gender = value ?? 1;
                    setState(() {});

                  }),
              const Divider(),

              RadioListTile<int>(
                  value: 2,
                  groupValue: gender,
                  title: Text('Femenino'),
                  onChanged: (value) {
                    gender = value ?? 2;
                    setState(() {});
                  }),
              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 20),
                child: TextFormField(
                  initialValue: 'Mao',
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre del usuario'
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
