import 'package:flutter/material.dart';

class Ejer1ResultadoScreen extends StatelessWidget {
  final String bloque; // Recibirá el bloque a mostrar como parámetro

  const Ejer1ResultadoScreen({Key? key, required this.bloque}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado - Tabla ASCII'),
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
              bloque,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
