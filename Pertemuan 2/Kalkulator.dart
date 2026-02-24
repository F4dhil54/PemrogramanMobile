import 'dart:io';

void main() {
  print("=== Konversi Mata Uang ===");
  print("1. Rupiah ke Dollar");
  print("2. Rupiah ke Euro");
  print("3. Rupiah ke Yen");

  stdout.write("Pilih menu (1-3): ");
  int pilihan = int.parse(stdin.readLineSync()!);

  stdout.write("Masukkan jumlah Rupiah: ");
  double rupiah = double.parse(stdin.readLineSync()!);

  double hasil = 0;

  switch (pilihan) {
    case 1:
      hasil = rupiah / 15000;
      print("Hasil: \$${hasil.toStringAsFixed(2)}");
      break;
    case 2:
      hasil = rupiah / 16000;
      print("Hasil: €${hasil.toStringAsFixed(2)}");
      break;
    case 3:
      hasil = rupiah / 110;
      print("Hasil: ¥${hasil.toStringAsFixed(2)}");
      break;
    default:
      print("Pilihan tidak valid");
  }
}