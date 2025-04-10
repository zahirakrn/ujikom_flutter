class PembelianResponse {
  bool? success;
  String? message;
  List<Data>? data;

  PembelianResponse({this.success, this.message, this.data});

  PembelianResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? namaPerusahaan;
  String? nama;
  int? jumlah;
  int? hargaBeli;
  String? tanggal;
  String? alamat;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.namaPerusahaan,
      this.nama,
      this.jumlah,
      this.hargaBeli,
      this.tanggal,
      this.alamat,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
