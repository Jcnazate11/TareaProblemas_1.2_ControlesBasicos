class Ejer1 {
  List<List<Map<String, String>>> generarBloques() {
    List<List<Map<String, String>>> bloques = [];
    List<Map<String, String>> bloqueActual = [];

    for (int i = 32; i <= 127; i++) {
      bloqueActual.add({
        'decimal': '$i',
        'char': String.fromCharCode(i),
        'hex': i.toRadixString(16).toUpperCase(),
      });

      if (bloqueActual.length == 10) {
        bloques.add(bloqueActual);
        bloqueActual = [];
      }
    }

    if (bloqueActual.isNotEmpty) {
      bloques.add(bloqueActual);
    }

    return bloques;
  }
}
