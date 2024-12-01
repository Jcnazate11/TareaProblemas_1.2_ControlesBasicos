import 'package:flutter/material.dart';
import 'Paginas/Ejer1.dart';
import 'Paginas/Ejer2.dart';
import 'Paginas/Ejer3.dart';
import 'Paginas/Ejer4.dart';
import 'Paginas/Ejer5.dart';
import 'Paginas/Ejer6.dart';


void main() {
  runApp(MyApp(),
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejer ESPE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
        debugShowCheckedModeBanner : false
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESPE Ejercicios App'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
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
              title: Text('Ejercicio Nº1'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ejer1()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.done_outline),
              title: Text('Ejercicio Nº2'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ejer2()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.done_outline),
              title: Text('Ejercicio Nº3'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ejer3()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.done_outline),
              title: Text('Ejercicio Nº4'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ejer4()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.done_outline),
              title: Text('Ejercicio Nº5'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ejer5()),
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
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school,
                    size: 64,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 16), // Espaciado entre ícono e imagen
                  Image.asset(
                    'assets/imagenes/espeLogo.jpg',
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'NRC 2509',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Tarea Nº1',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Card(
                color: Colors.green[100],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.book, size: 32, color: Colors.green),
                      SizedBox(height: 4),
                      Text(
                        'Ejecución de Ejercicios',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Número de Ejercicios',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Icon(Icons.group, size: 28),
                  SizedBox(width: 8),
                  Text(
                    'Miembros del Grupo',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              SizedBox(height: 8),
              ...[
                'Jeanhela Nazate',
                'Cristhopher Villamarin',
                'Stephen Drouet'
              ].map((member) => Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    member,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
