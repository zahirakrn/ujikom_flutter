class BarangResponse {
  int? id;
  String? kodeBarang;
  int? idKategori;
  int? idPembelian;
  int? stok;
  String? unit;
  int? hargaJual;
  Pembelian? pembelian; // 🔹 Tambahkan relasi ke pembelian

  BarangResponse({
    this.id,
    this.kodeBarang,
    this.idKategori,
    this.idPembelian,
    this.stok,
    this.unit,
    this.hargaJual,
    this.pembelian, // 🔹
  });

  factory BarangResponse.fromJson(Map<String, dynamic> json) {
    return BarangResponse(
      id: json['id'],
      kodeBarang: json['kode_barang'],
      idKategori: json['id_kategori'],
      idPembelian: json['id_pembelian'],
      stok: json['stok'],
      unit: json['unit'],
      hargaJual: json['harga_jual'],
      pembelian:
          json['pembelian'] != null // 🔹 Jika ada data pembelian, parse juga
              ? Pembelian.fromJson(json['pembelian'])
              : null,
    );
  }
}

class Pembelian {
  int? id;
  String? nama;

  Pembelian({this.id, this.nama});

  factory Pembelian.fromJson(Map<String, dynamic> json) {
    return Pembelian(
      id: json['id'],
      nama: json['nama'],
    );
  }
}
