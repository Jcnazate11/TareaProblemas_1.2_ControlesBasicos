class Ejer1 {
  // Constructor vacío para esta clase
  const Ejer1();

  String mostrarTabla() {
    int n = -1;
    StringBuffer salida = StringBuffer(); // Para acumular la salida en un String

    while (++n <= 255) {
      // Pausar cada 23 caracteres
      if (n % 23 == 0 && n != 0) {
        salida.write("\nPulse Enter para continuar...\n");
      }

      // Acumular el número y su carácter ASCII correspondiente
      salida.write('\t$n = \'${String.fromCharCode(n)}\'\n');
    }

    return salida.toString(); // Devolver la salida completa como String
  }
}