import 'package:flutter/material.dart';

class Ejer4 extends StatefulWidget {
  @override
  _Ejer4State createState() => _Ejer4State();
}

class _Ejer4State extends State<Ejer4> {

  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  final TextEditingController _controllerC = TextEditingController();

  String resultado = '';


  void verificarTipoTriangulo() {
    setState(() {
      double? A = double.tryParse(_controllerA.text);
      double? B = double.tryParse(_controllerB.text);
      double? C = double.tryParse(_controllerC.text);

      if (A == null || B == null || C == null) {
        resultado = 'Por favor, ingrese valores numéricos válidos.';
        return;
      }


      if ((A + B > C) && (A + C > B) && (B + C > A)) {
        if (A == B && B == C) {
          resultado = 'El triángulo es equilátero.';
        } else if (A == B || A == C || B == C) {
          resultado = 'El triángulo es isósceles.';
        } else {
          resultado = 'El triángulo es escaleno.';
        }
      } else {
        resultado = 'No se puede formar un triángulo con las magnitudes ingresadas.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipo de Triángulo'),
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
              decoration: InputDecoration(labelText: 'Ingrese el primer número (A)'),
            ),
            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el segundo número (B)'),
            ),
            TextField(
              controller: _controllerC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el tercer número (C)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: verificarTipoTriangulo,
              child: Text('Verificar Tipo de Triángulo'),
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
