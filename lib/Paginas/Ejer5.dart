import 'package:flutter/material.dart';

class Ejer5 extends StatefulWidget {
  @override
  _Ejer5State createState() => _Ejer5State();
}

class _Ejer5State extends State<Ejer5> {
  final TextEditingController _antiguedadController = TextEditingController();
  final TextEditingController _sueldoController = TextEditingController();
  String _resultado = '';

  // Función para calcular el nuevo sueldo
  void _calcularSueldo() {
    // Validar que los valores sean mayores que 0
    int antiguedad = int.tryParse(_antiguedadController.text) ?? 0;
    double sueldoActual = double.tryParse(_sueldoController.text) ?? 0.0;

    if (antiguedad <= 0 || sueldoActual <= 0) {
      setState(() {
        _resultado = 'Error: La antigüedad y el sueldo deben ser mayores a 0.';
      });
      return;
    }

    double sueldoExtra = 0;

    // Calcular el reajuste según las condiciones
    if (antiguedad < 10) {
      if (sueldoActual <= 300000) {
        sueldoExtra = sueldoActual * 0.12;  // 12% de reajuste
      } else if (sueldoActual <= 500000) {
        sueldoExtra = sueldoActual * 0.10;  // 10% de reajuste
      } else {
        sueldoExtra = sueldoActual * 0.08;  // 8% de reajuste
      }
    } else if (antiguedad <= 20) {
      if (sueldoActual <= 300000) {
        sueldoExtra = sueldoActual * 0.14;  // 14% de reajuste
      } else if (sueldoActual <= 500000) {
        sueldoExtra = sueldoActual * 0.12;  // 12% de reajuste
      } else {
        sueldoExtra = sueldoActual * 0.10;  // 10% de reajuste
      }
    } else {
      sueldoExtra = sueldoActual * 0.15;  // 15% de reajuste para antigüedad >= 20
    }

    // Calcular el nuevo sueldo
    double nuevoSueldo = sueldoActual + sueldoExtra;

    // Actualizar el resultado
    setState(() {
      _resultado = 'El nuevo sueldo del empleado es: \$${nuevoSueldo.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio Nº5 - Reajuste de Sueldos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _antiguedadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Antigüedad del empleado (años)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _sueldoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sueldo actual del empleado (\$)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularSueldo,
              child: Text('Calcular Nuevo Sueldo'),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
