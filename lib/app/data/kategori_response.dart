class KategoriResponse {
  final int id;
  final String nama;
  final DateTime createdAt;
  final DateTime updatedAt;

  KategoriResponse({
    required this.id,
    required this.nama,
    required this.createdAt,
    required this.updatedAt,
  });

  factory KategoriResponse.fromJson(Map<String, dynamic> json) {
    return KategoriResponse(
      id: json['id'],
      nama: json['nama'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}
