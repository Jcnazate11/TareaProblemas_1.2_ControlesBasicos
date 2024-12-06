import 'package:flutter/material.dart';

class Ejercicio5ResultadoScreen extends StatelessWidget {
  final List<int> primos; // Recibe la lista de números primos como parámetro

  const Ejercicio5ResultadoScreen({Key? key, required this.primos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado - Números Primos'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade600, Colors.cyan.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              primos.join(', '), // Muestra todos los números primos en una sola cadena
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
