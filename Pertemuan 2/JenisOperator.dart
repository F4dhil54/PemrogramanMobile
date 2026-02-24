void main() {
  int a = 10;
  int b = 5;

  // Operator Aritmatika
  print("Penjumlahan: ${a + b}");
  print("Pengurangan: ${a - b}");
  print("Perkalian: ${a * b}");
  print("Pembagian: ${a / b}");
  print("Modulo: ${a % b}");

  // Operator Relasi
  print("a > b: ${a > b}");
  print("a < b: ${a < b}");
  print("a == b: ${a == b}");
  print("a != b: ${a != b}");

  // Operator Logika
  print("(a > 5 && b < 10): ${(a > 5 && b < 10)}");
  print("(a < 5 || b < 10): ${(a < 5 || b < 10)}");

  // Operator Assignment
  int c = 10;
  c += 5;
  print("c += 5: $c");

  // Operator Increment
  c++;
  print("c++: $c");
}