import 'package:flutter/material.dart';
import 'ejer1_screen.dart';


class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú de Opciones',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.done_outline),
            title: Text('Ejercicio Nº1.2 - Controladores Básicos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ejer1()),
              );
            },
          ),
         /* ListTile(
            leading: Icon(Icons.done_outline),
            title: Text('Ejercicio Nº2'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ejer2()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.done_outline),
            title: Text('Ejercicio Nº3'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ejer3()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.done_outline),
            title: Text('Ejercicio Nº4'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ejer4()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.done_outline),
            title: Text('Ejercicio Nº5'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ejer5()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.done_outline),
            title: Text('Ejercicio Nº6'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ejer6()),
              );
            },
          ),*/
        ],
      ),
    );
  }
}
