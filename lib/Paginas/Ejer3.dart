import 'package:flutter/material.dart';
import 'dart:math';

class Ejer3 extends StatefulWidget {
  @override
  _Ejer3State createState() => _Ejer3State();
}

class _Ejer3State extends State<Ejer3> {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  final TextEditingController _controllerC = TextEditingController();

  String resultado = '';

  void calcularRaices() {
    setState(() {
      double? A = double.tryParse(_controllerA.text);
      double? B = double.tryParse(_controllerB.text);
      double? C = double.tryParse(_controllerC.text);

      if (A == null || B == null || C == null) {
        resultado = 'Ingrese todos los coeficientes.';
        return;
      }

      if (A == 0) {
        resultado = 'El coeficiente A no corresponde a una ecuación de segundo grado.';
        return;
      }

      double argumento = B * B - 4 * A * C;

      if (argumento < 0) {
        resultado = 'La ecuación tiene soluciones imaginarias.';
      } else {
        double raiz1 = (-B + sqrt(argumento)) / (2 * A);
        double raiz2 = (-B - sqrt(argumento)) / (2 * A);
        resultado = 'Las raíces son: $raiz1 y $raiz2';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecuación de Segundo Grado'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el coeficiente A'),
            ),
            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el coeficiente B'),
            ),
            TextField(
              controller: _controllerC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el coeficiente C'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularRaices,
              child: Text('Calcular Raíces'),
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

