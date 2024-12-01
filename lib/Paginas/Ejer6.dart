import 'package:flutter/material.dart';

class Ejer6 extends StatefulWidget {
  @override
  _Ejer6State createState() => _Ejer6State();
}

class _Ejer6State extends State<Ejer6> {
  final TextEditingController _controllerSueldoBase = TextEditingController();
  final TextEditingController _controllerHorasNormales = TextEditingController();
  final TextEditingController _controllerHorasNocturnas = TextEditingController();

  String resultado = '';

  void calcularSueldoSemanal() {
    setState(() {
      // Valores constantes para el cálculo
      const double VALOR_HORA_NORMAL = 2000;
      const double VALOR_HORA_NOCTURNA = 1.3 * VALOR_HORA_NORMAL;

      // Convertir los valores ingresados a números
      double? sueldoBase = double.tryParse(_controllerSueldoBase.text);
      double? horasNormales = double.tryParse(_controllerHorasNormales.text);
      double? horasNocturnas = double.tryParse(_controllerHorasNocturnas.text);

      // Verificar que los valores ingresados son válidos
      if (sueldoBase == null || horasNormales == null || horasNocturnas == null) {
        resultado = 'Por favor, ingrese valores numéricos válidos.';
        return;
      }

      // Calcular el sueldo semanal
      double sueldoSemanal = sueldoBase +
          (horasNormales * VALOR_HORA_NORMAL) +
          (horasNocturnas * VALOR_HORA_NOCTURNA);

      resultado = 'El sueldo semanal del trabajador es: \$${sueldoSemanal.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo de Sueldo Semanal'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerSueldoBase,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el sueldo base'),
            ),
            TextField(
              controller: _controllerHorasNormales,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese horas extra normales (7 AM a 12 PM)'),
            ),
            TextField(
              controller: _controllerHorasNocturnas,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese horas extra nocturnas (12 PM a 7 AM)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularSueldoSemanal,
              child: Text('Calcular Sueldo'),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
