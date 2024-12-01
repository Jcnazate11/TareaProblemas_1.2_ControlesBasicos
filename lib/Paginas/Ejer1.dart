import 'package:flutter/material.dart';

class Ejer1 extends StatefulWidget {
  @override
  _Ejer1State createState() => _Ejer1State();
}

class _Ejer1State extends State<Ejer1> {

  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  final TextEditingController _controllerC = TextEditingController();

  String resultado = '';


  void ordenarNumeros() {
    setState(() {
      double? A = double.tryParse(_controllerA.text);
      double? B = double.tryParse(_controllerB.text);
      double? C = double.tryParse(_controllerC.text);

      if (A == null || B == null || C == null) {
        resultado = 'Por favor, ingrese valores numéricos válidos.';
        return;
      }

      if (A == B && B == C) {
        resultado = 'Los números son iguales: $A, $B, $C';
      } else {
        List<double> numeros = [A, B, C];
        numeros.sort();
        resultado = 'El orden  es: ${numeros[0]}, ${numeros[1]}, ${numeros[2]}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordenar Tres Números'),
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
              onPressed: ordenarNumeros,
              child: Text('Ordenar'),
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
