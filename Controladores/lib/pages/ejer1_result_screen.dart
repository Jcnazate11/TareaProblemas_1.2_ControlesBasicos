import 'package:flutter/material.dart';

class Ejer1ResultadoScreen extends StatelessWidget {
  final List<Map<String, String>> bloque; // Recibirá el bloque como parámetro

  const Ejer1ResultadoScreen({Key? key, required this.bloque}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado - Tabla ASCII'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Decimal')),
                    DataColumn(label: Text('Carácter')),
                    DataColumn(label: Text('Hexadecimal')),
                  ],
                  rows: bloque
                      .map(
                        (item) => DataRow(cells: [
                      DataCell(Text(item['decimal']!)),
                      DataCell(Text(item['char']!)),
                      DataCell(Text(item['hex']!)),
                    ]),
                  )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
