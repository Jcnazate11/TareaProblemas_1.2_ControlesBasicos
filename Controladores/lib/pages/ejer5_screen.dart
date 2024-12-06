import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../logica/ejer5_logica.dart';
import 'ejer5_result_screen.dart';

class Ejercicio5Screen extends StatelessWidget {
  final Ejercicio5Logica _logica = Ejercicio5Logica(); // Instancia de la lógica

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.cyan],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Título y botón de regresar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Regresar a la pantalla anterior
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Ejercicio 5 - Números Primos',
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
                        // Tarjeta principal
                        Card(
                          margin: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                // Icono decorativo
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.calculator,
                                    size: 48,
                                    color: Colors.blue.shade600,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                // Título
                                const Text(
                                  'Calculadora de Números Primos',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                // Descripción
                                const Text(
                                  'Descubre los números primos y sus propiedades matemáticas únicas',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 24),
                                // Botón principal
                                ElevatedButton.icon(
                                  icon: const Icon(FontAwesomeIcons.calculator),
                                  label: const Text('Calcular Números Primos'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 16,
                                    ),
                                    textStyle: const TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    // Generar la lista de números primos y navegar al resultado
                                    List<int> primos = _logica.calcularPrimos();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Ejercicio5ResultadoScreen(primos: primos),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Iconos decorativos
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildDecorativeIcon(FontAwesomeIcons.hashtag),
                            const SizedBox(width: 16),
                            _buildDecorativeIcon(FontAwesomeIcons.calculator),
                            const SizedBox(width: 16),
                            _buildDecorativeIcon(FontAwesomeIcons.hashtag),
                          ],
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

  Widget _buildDecorativeIcon(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
