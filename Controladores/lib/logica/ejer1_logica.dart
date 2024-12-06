class Ejer1 {
  const Ejer1();

  // Genera bloques de 23 valores
  List<String> generarBloques() {
    List<String> bloques = [];
    StringBuffer bloqueActual = StringBuffer();

    for (int n = 0; n <= 255; n++) {
      String caracter = n >= 32 && n <= 126
          ? String.fromCharCode(n)
          : '<${_descripcionCaracterControl(n)}>'; // Descripción para caracteres de control

      // Añade número y carácter al bloque actual
      bloqueActual.write('$n = \'$caracter\'\n');

      // Cada 23 caracteres, guardar el bloque y comenzar uno nuevo
      if ((n + 1) % 23 == 0 || n == 255) {
        bloques.add(bloqueActual.toString());
        bloqueActual.clear();
      }
    }

    return bloques; // Devuelve la lista de bloques
  }

  // Descripciones para caracteres de control
  String _descripcionCaracterControl(int n) {
    switch (n) {
      case 0:
        return 'NULO';
      case 9:
        return 'TAB';
      case 10:
        return 'SALTO';
      case 13:
        return 'RETORNO';
      default:
        return 'CTRL$n';
    }
  }
}
