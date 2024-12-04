import 'package:flutter/material.dart';
import 'ejer4_result_screen.dart';

class Ejercicio4 extends StatefulWidget {
  const Ejercicio4({Key? key}) : super(key: key);

  @override
  State<Ejercicio4> createState() => _EjercicioFactorizacionState();
}

class _EjercicioFactorizacionState extends State<Ejercicio4> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factorización'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white24,
              Colors.black12,
              Colors.white,
              Colors.white54,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/imagenes/factorizacion.jpg', height: 100), // Imagen
              const SizedBox(height: 30),
              const Text(
                'Ingrese un número para factorizar:',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Número',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    final int numero = int.parse(_controller.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ejer4Resultado(numero: numero),
                      ),
                    );
                  }
                },
                child: const Text('Factorizar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
