class Factorizacion {
  static List<Map<String, int>> factorizar(int numero) {
    List<Map<String, int>> factores = [];
    int factor = 2;

    while (numero > 1) {
      int potencia = 0;

      while (numero % factor == 0) {
        potencia++;
        numero ~/= factor;
      }

      if (potencia > 0) {
        factores.add({'factor': factor, 'potencia': potencia});
      }

      factor++;
    }

    return factores;
  }
}
