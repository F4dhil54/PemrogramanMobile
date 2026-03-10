void main() {
  String nama = "Fadhil Syahidan";
  String nim = "244107060125";

  double nilaiUnikNIM = double.parse(nim.substring(nim.length - 3));
  List<double> hargaBarang = [50000.5, 75000.75, 30000.25, 45000.0, 25000.5];
  hargaBarang.add(nilaiUnikNIM);

  String? pesanDiskon;
  double totalAwal = hitungTotal(hargaBarang);
  double diskon = 0;

  if (totalAwal > 200000) {
    diskon = totalAwal * 0.10;
    pesanDiskon = "Diskon 10%";
  } else if (totalAwal >= 100000) {
    diskon = totalAwal * 0.05;
    pesanDiskon = "Diskon 5%";
  } else {
    diskon = 0;
    pesanDiskon = "Tidak ada diskon";
  }

  double totalAkhir = totalAwal - diskon;

  print("Nama: $nama");
  print("NIM: $nim");
  print("Total Awal: Rp $totalAwal");
  print("Besar Diskon: Rp $diskon");
  print("Total Akhir: Rp $totalAkhir");
  print("Keterangan: ${pesanDiskon!}");
}

double hitungTotal(List<double> daftarHarga) {
  double total = 0;
  for (double harga in daftarHarga) {
    total += harga;
  }
  return total;
}