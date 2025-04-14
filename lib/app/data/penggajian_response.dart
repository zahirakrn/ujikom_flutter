class PenggajianResponse {
  int? id;
  String? namaPegawai;
  int? jumlahGaji;
  String? tanggalGaji;
  String? status;
  String? kontak;
  String? createdAt;
  String? updatedAt;

  PenggajianResponse(
      {this.id,
      this.namaPegawai,
      this.jumlahGaji,
      this.tanggalGaji,
      this.status,
      this.kontak,
      this.createdAt,
      this.updatedAt});

  PenggajianResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPegawai = json['nama_pegawai'];
    jumlahGaji = json['jumlah_gaji'];
    tanggalGaji = json['tanggal_gaji'];
    status = json['status'];
    kontak = json['kontak'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_pegawai'] = this.namaPegawai;
    data['jumlah_gaji'] = this.jumlahGaji;
    data['tanggal_gaji'] = this.tanggalGaji;
    data['status'] = this.status;
    data['kontak'] = this.kontak;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
