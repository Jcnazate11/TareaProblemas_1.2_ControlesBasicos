class Ejercicio5Logica {
  // Genera una lista de números primos entre 3 y 32767
  List<int> calcularPrimos() {
    List<int> primos = [];
    for (int numero = 3; numero <= 32767; numero++) {
      if (_esPrimo(numero)) {
        primos.add(numero);
      }
    }
    return primos;
  }

  // Verifica si un número es primo
  bool _esPrimo(int numero) {
    for (int divisor = 2; divisor < numero; divisor++) {
      if (numero % divisor == 0) {
        return false; // Si encuentra un divisor, no es primo
      }
    }
    return true; // Si no encuentra divisores, es primo
  }
}
