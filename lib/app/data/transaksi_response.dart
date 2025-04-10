class TransaksiResponse {
  int? id;
  String? nama;
  String? tanggal;
  String? jenis;
  String? total;
  String? createdAt;
  String? updatedAt;
  List<Barangs>? barangs;

  TransaksiResponse(
      {this.id,
      this.nama,
      this.tanggal,
      this.jenis,
      this.total,
      this.createdAt,
      this.updatedAt,
      this.barangs});

  TransaksiResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    tanggal = json['tanggal'];
    jenis = json['jenis'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['barangs'] != null) {
      barangs = <Barangs>[];
      json['barangs'].forEach((v) {
        barangs!.add(new Barangs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['tanggal'] = this.tanggal;
    data['jenis'] = this.jenis;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.barangs != null) {
      data['barangs'] = this.barangs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Barangs {
  int? id;
  int? idKategori;
  int? idPembelian;
  String? kodeBarang;
  int? hargaJual;
  int? stok;
  String? unit;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Barangs(
      {this.id,
      this.idKategori,
      this.idPembelian,
      this.kodeBarang,
      this.hargaJual,
      this.stok,
      this.unit,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Barangs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKategori = json['id_kategori'];
    idPembelian = json['id_pembelian'];
    kodeBarang = json['kode_barang'];
    hargaJual = json['harga_jual'];
    stok = json['stok'];
    unit = json['unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? transaksiId;
  int? barangId;
  int? jumlah;
  String? subtotal;
  String? createdAt;
  String? updatedAt;

  Pivot(
      {this.transaksiId,
      this.barangId,
      this.jumlah,
      this.subtotal,
      this.createdAt,
      this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    transaksiId = json['transaksi_id'];
    barangId = json['barang_id'];
    jumlah = json['jumlah'];
    subtotal = json['subtotal'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaksi_id'] = this.transaksiId;
    data['barang_id'] = this.barangId;
    data['jumlah'] = this.jumlah;
    data['subtotal'] = this.subtotal;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
