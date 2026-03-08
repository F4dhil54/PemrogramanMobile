import 'dart:io';

void main() {
  print("Program Cek Bilangan Prima");

  stdout.write("Masukkan sebuah angka bulat: ");
  int angka = int.parse(stdin.readLineSync()!);

  bool prima = true;

  if (angka <= 1) {
    prima = false;
  } else {
    for (int i = 2; i <= angka ~/ 2; i++) {
      if (angka % i == 0) {
        prima = false;
        break;
      }
    }
  }

  if (prima) {
    print("$angka adalah bilangan prima");
  } else {
    print("$angka bukan bilangan prima");
  }
}