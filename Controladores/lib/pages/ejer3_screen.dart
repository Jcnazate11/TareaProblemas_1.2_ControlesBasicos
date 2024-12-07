import 'package:controladores/logica/ejer3_logica.dart';
import 'package:controladores/pages/ejer3_result_screen.dart';
import 'package:flutter/material.dart';

class MCDInputScreen extends StatefulWidget {
  const MCDInputScreen({Key? key}) : super(key: key);

  @override
  State<MCDInputScreen> createState() => _MCDInputScreenState();
}

class _MCDInputScreenState extends State<MCDInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();

  void _navigateToResult(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final int number1 = int.parse(_number1Controller.text);
      final int number2 = int.parse(_number2Controller.text);
      final MCD mcd = MCD();
      final int resultado = mcd.calcular(number1, number2);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MCDResultScreen(
            number1: number1,
            number2: number2,
            resultado: resultado,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cálculo de MCD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.calculate_rounded,
                          size: 64,
                          color: Color(0xFF2196F3),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Calculadora MCD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1565C0),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _number1Controller,
                          decoration: InputDecoration(
                            labelText: 'Primer número',
                            prefixIcon: const Icon(Icons.looks_one, color: Color(0xFF2196F3)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF2196F3), width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingresa un número';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Debe ser un número válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _number2Controller,
                          decoration: InputDecoration(
                            labelText: 'Segundo número',
                            prefixIcon: const Icon(Icons.looks_two, color: Color(0xFF2196F3)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF2196F3), width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingresa un número';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Debe ser un número válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () => _navigateToResult(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2196F3),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 3,
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.calculate_outlined),
                              SizedBox(width: 8),
                              Text(
                                'Calcular MCD',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}