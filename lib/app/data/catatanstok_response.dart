class CatatanStokResponse {
  int? id;
  int? idBarang;
  String? jenis;
  int? jumlah;
  String? tanggal;
  String? keterangan;
  String? createdAt;
  String? updatedAt;
  Barang? barang;

  CatatanStokResponse(
      {this.id,
      this.idBarang,
      this.jenis,
      this.jumlah,
      this.tanggal,
      this.keterangan,
      this.createdAt,
      this.updatedAt,
      this.barang});

  CatatanStokResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBarang = json['id_barang'];
    jenis = json['jenis'];
    jumlah = json['jumlah'];
    tanggal = json['tanggal'];
    keterangan = json['keterangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    barang =
        json['barang'] != null ? new Barang.fromJson(json['barang']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_barang'] = this.idBarang;
    data['jenis'] = this.jenis;
    data['jumlah'] = this.jumlah;
    data['tanggal'] = this.tanggal;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.barang != null) {
      data['barang'] = this.barang!.toJson();
    }
    return data;
  }
}

class Barang {
  int? id;
  int? idKategori;
  int? idPembelian;
  String? kodeBarang;
  int? hargaJual;
  int? stok;
  String? unit;
  String? createdAt;
  String? updatedAt;

  Barang(
      {this.id,
      this.idKategori,
      this.idPembelian,
      this.kodeBarang,
      this.hargaJual,
      this.stok,
      this.unit,
      this.createdAt,
      this.updatedAt});

  Barang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKategori = json['id_kategori'];
    idPembelian = json['id_pembelian'];
    kodeBarang = json['kode_barang'];
    hargaJual = json['harga_jual'];
    stok = json['stok'];
    unit = json['unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_kategori'] = this.idKategori;
    data['id_pembelian'] = this.idPembelian;
    data['kode_barang'] = this.kodeBarang;
    data['harga_jual'] = this.hargaJual;
    data['stok'] = this.stok;
    data['unit'] = this.unit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
