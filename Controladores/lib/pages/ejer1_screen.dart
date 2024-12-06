import 'package:flutter/material.dart';
import '../logica/ejer1_logica.dart';
import 'ejer1_result_screen.dart';

class Ejercicio1Screen extends StatefulWidget {
  @override
  _Ejercicio1ScreenState createState() => _Ejercicio1ScreenState();
}

class _Ejercicio1ScreenState extends State<Ejercicio1Screen> {
  final Ejer1 _logica = Ejer1(); // Instancia de la lógica
  late List<List<Map<String, String>>> _bloques; // Bloques generados por la lógica
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Ejercicio 1 - Tabla ASCII',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.blue,
                                  child: Icon(
                                    Icons.table_chart,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Tabla ASCII',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Explora los caracteres ASCII y sus valores numéricos correspondientes',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.visibility),
                                  label: const Text('Ver Resultado Actual'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    minimumSize: const Size(double.infinity, 50),
                                  ),
                                  onPressed: _navegarResultado,
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.arrow_forward),
                                  label: const Text('Siguiente Bloque'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    minimumSize: const Size(double.infinity, 50),
                                  ),
                                  onPressed: _siguienteBloque,
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.refresh),
                                  label: const Text('Reiniciar'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    minimumSize: const Size(double.infinity, 50),
                                  ),
                                  onPressed: _reiniciar,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
