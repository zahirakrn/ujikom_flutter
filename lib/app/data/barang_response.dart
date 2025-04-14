import 'package:project_ujikom/app/data/transaksi_response.dart';

class BarangResponse {
  int? id;
  int? idKategori;
  int? idPembelian;
  String? kodeBarang;
  int? hargaJual;
  int? stok;
  String? unit;
  String? createdAt;
  String? updatedAt;
  Pembelian? pembelian;
  Kategori? kategori;
  Pivot? pivot;

  BarangResponse(
      {this.id,
      this.idKategori,
      this.idPembelian,
      this.kodeBarang,
      this.hargaJual,
      this.stok,
      this.unit,
      this.createdAt,
      this.updatedAt,
      this.pembelian,
      this.kategori,
      this.pivot});

  BarangResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKategori = json['id_kategori'];
    idPembelian = json['id_pembelian'];
    kodeBarang = json['kode_barang'];
    hargaJual = json['harga_jual'];
    stok = json['stok'];
    unit = json['unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pembelian = json['pembelian'] != null
        ? new Pembelian.fromJson(json['pembelian'])
        : null;
    kategori = json['kategori'] != null
        ? new Kategori.fromJson(json['kategori'])
        : null;
    pivot = json['pivot'] != null
        ? Pivot.fromJson(json['pivot']) 
        : null;

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
    if (this.pembelian != null) {
      data['pembelian'] = this.pembelian!.toJson();
    }
    if (this.kategori != null) {
      data['kategori'] = this.kategori!.toJson();
    }
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pembelian {
  int? id;
  String? namaPerusahaan;
  String? nama;
  int? jumlah;
  int? hargaBeli;
  String? tanggal;
  String? alamat;
  String? createdAt;
  String? updatedAt;

  Pembelian(
      {this.id,
      this.namaPerusahaan,
      this.nama,
      this.jumlah,
      this.hargaBeli,
      this.tanggal,
      this.alamat,
      this.createdAt,
      this.updatedAt});

  Pembelian.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPerusahaan = json['nama_perusahaan'];
    nama = json['nama'];
    jumlah = json['jumlah'];
    hargaBeli = json['harga_beli'];
    tanggal = json['tanggal'];
    alamat = json['alamat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_perusahaan'] = this.namaPerusahaan;
    data['nama'] = this.nama;
    data['jumlah'] = this.jumlah;
    data['harga_beli'] = this.hargaBeli;
    data['tanggal'] = this.tanggal;
    data['alamat'] = this.alamat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Kategori {
  int? id;
  String? nama;
  String? createdAt;
  String? updatedAt;

  Kategori({this.id, this.nama, this.createdAt, this.updatedAt});

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

