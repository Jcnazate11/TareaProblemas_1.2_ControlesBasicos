import 'package:flutter/material.dart';
import 'ejer2_result_screen.dart';

class Ejercicio1 extends StatefulWidget {
  const Ejercicio1({Key? key}) : super(key: key);

  @override
  State<Ejercicio1> createState() => _PantallaEntradaState();
}

class _PantallaEntradaState extends State<Ejercicio1> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo Factorial'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen en el centro
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/factorial_icon.png'),
              ),
              const SizedBox(height: 30),
              const Text(
                'Ingrese un número para calcular su factorial:',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Campo de texto más corto
              SizedBox(
                width: 200,
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
                        builder: (context) => Ejer2Resultado(numero: numero),
                      ),
                    );
                  }
                },
                child: const Text('Calcular'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
