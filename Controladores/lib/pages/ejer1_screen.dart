import 'package:flutter/material.dart';
import '../logica/ejer1_logica.dart';
import 'ejer1_result_screen.dart';

class Ejercicio1Screen extends StatefulWidget {
  @override
  _Ejercicio1ScreenState createState() => _Ejercicio1ScreenState();
}

class _Ejercicio1ScreenState extends State<Ejercicio1Screen> {
  final Ejer1 _logica = Ejer1(); // Instancia de la lógica
  late List<String> _bloques; // Bloques generados por la lógica
  int _indiceActual = 0; // Índice del bloque actual

  @override
  void initState() {
    super.initState();
    _bloques = _logica.generarBloques(); // Generar los bloques al iniciar
  }

  void _navegarResultado() {
    // Navegar hacia la pantalla de resultados
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Ejer1ResultadoScreen(bloque: _bloques[_indiceActual]),
      ),
    );
  }

  void _siguienteBloque() {
    setState(() {
      if (_indiceActual < _bloques.length - 1) {
        _indiceActual++; // Avanzar al siguiente bloque
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _indiceActual = 0; // Reiniciar al primer bloque
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 1 - Tabla ASCII'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Botón para navegar a la pantalla de resultados
            ElevatedButton.icon(
              icon: Icon(Icons.view_list),
              label: Text('Ver Resultado Actual'),
              onPressed: _navegarResultado,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Botón para avanzar al siguiente bloque
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_forward),
              label: Text('Siguiente Bloque'),
              onPressed: _indiceActual < _bloques.length - 1 ? _siguienteBloque : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 8),
            // Botón para reiniciar la tabla
            ElevatedButton.icon(
              icon: Icon(Icons.restart_alt),
              label: Text('Reiniciar'),
              onPressed: _reiniciar,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
