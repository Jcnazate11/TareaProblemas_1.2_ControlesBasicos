import 'package:flutter/material.dart';

class Ejer2 extends StatefulWidget {
  @override
  _Ejer2State createState() => _Ejer2State();
}

class _Ejer2State extends State<Ejer2> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';

  void _calcularPrecio() {
    String input = _controller.text;
    if (input.isEmpty) {
      setState(() {
        _resultado = 'Por favor ingresa un número válido';
      });
      return;
    }

    int camisetas = int.tryParse(input) ?? 0;

    if (camisetas < 0) {
      setState(() {
        _resultado = 'El número de camisas no puede ser negativo';
      });
      return;
    }

    const double precioCamisetaMenor3 = 4800;
    const double precioCamisetaMayor3 = 4000;
    double precioTotal = 0;

    if (camisetas <= 3) {
      precioTotal = camisetas * precioCamisetaMenor3;
    } else {
      precioTotal = (camisetas ) * precioCamisetaMayor3;
    }
    setState(() {
      _resultado = 'El precio total de la compra es: \$${precioTotal.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio Nº2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresa el número de camisas',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularPrecio,
              child: Text('Calcular Precio'),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
