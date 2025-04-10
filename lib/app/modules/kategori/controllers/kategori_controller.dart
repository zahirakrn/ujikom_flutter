import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/kategori_response.dart';
import 'package:project_ujikom/app/utils/api.dart';
import 'dart:convert';

class KategoriController extends GetxController {
  var kategoriList = <KategoriResponse>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchKategori();
    super.onInit();
  }

  Future<void> fetchKategori() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(BaseUrl.kategoris));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        kategoriList.value =
            jsonData.map((e) => KategoriResponse.fromJson(e)).toList();
      } else {
        Get.snackbar('Error', 'Gagal mengambil data kategori');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateKategori(int id, String namaKategori) async {
    try {
      final response = await http.put(
        Uri.parse('${BaseUrl.kategoris}/$id'),
        body: {'nama': namaKategori},
      );

      if (response.statusCode == 200) {
        fetchKategori();
        Get.snackbar('Sukses', 'Kategori berhasil diperbarui');
      } else {
        Get.snackbar('Error', 'Gagal memperbarui kategori');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    }
  }

  void deleteKategori(int id) {
    Get.defaultDialog(
      title: 'Konfirmasi Hapus',
      middleText: 'Apakah Anda yakin ingin menghapus kategori ini?',
      textConfirm: 'Ya',
      textCancel: 'Batal',
      onConfirm: () async {
        try {
          final response =
              await http.delete(Uri.parse('${BaseUrl.kategoris}/$id'));

          if (response.statusCode == 200) {
            kategoriList.removeWhere((kategori) => kategori.id == id);
            Get.snackbar('Sukses', 'Kategori berhasil dihapus');
          } else {
            Get.snackbar('Error', 'Gagal menghapus kategori');
          }
        } catch (e) {
          Get.snackbar('Error', 'Terjadi kesalahan: $e');
        }
        Get.back(); // Tutup dialog
      },
    );
  }
}
