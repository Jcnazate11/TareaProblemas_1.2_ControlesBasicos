class OperacionesFactorial {
  static double calcularFactorial(int numero) {
    double factorial = 1;
    for (int i = numero; i > 1; i--) {
      factorial *= i;
    }
    return factorial;
  }
}
