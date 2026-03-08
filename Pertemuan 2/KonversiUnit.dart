import 'dart:io';

void main() {
  Map<String, Map<String, double>> konversi = {
    "panjang": {
      "meter": 1,
      "kilometer": 1000,
      "centimeter": 0.01,
      "millimeter": 0.001,
      "inch": 0.0254
    },
    "massa": {
      "kg": 1,
      "gram": 0.001,
      "mg": 0.000001,
      "ton": 1000,
      "ons": 0.1
    },
    "suhu": {
      "celsius": 1,
      "reamur": 0.8,
      "fahrenheit": 33.8,
      "kelvin": 274.15,
      "rankine": 493.47
    }
  };

  print("=================================");
  print("      APLIKASI KONVERSI UNIT     ");
  print("=================================");
  print("Kategori tersedia: panjang, massa, suhu");

  stdout.write("Pilih kategori: ");
  String kategori = stdin.readLineSync()!.trim().toLowerCase();

  if (!konversi.containsKey(kategori)) {
    print("❌ Kategori tidak tersedia!");
    return;
  }

  print("\nUnit tersedia: ${konversi[kategori]!.keys.join(", ")}");

  stdout.write("Dari unit: ");
  String dari = stdin.readLineSync()!.trim().toLowerCase();

  stdout.write("Ke unit: ");
  String ke = stdin.readLineSync()!.trim().toLowerCase();

  if (!konversi[kategori]!.containsKey(dari) ||
      !konversi[kategori]!.containsKey(ke)) {
    print("❌ Unit tidak valid!");
    return;
  }

  stdout.write("Masukkan nilai: ");
  String? inputNilai = stdin.readLineSync();

  double? nilai = double.tryParse(inputNilai ?? "");

  if (nilai == null) {
    print("❌ Input harus berupa angka!");
    return;
  }

  if (nilai < 0) {
    print("❌ Nilai tidak boleh negatif!");
    return;
  }

  double hasil =
      nilai * konversi[kategori]![dari]! / konversi[kategori]![ke]!;

  print("\n=================================");
  print("          HASIL KONVERSI         ");
  print("=================================");
  print("$nilai $dari = ${hasil.toStringAsFixed(4)} $ke");
}