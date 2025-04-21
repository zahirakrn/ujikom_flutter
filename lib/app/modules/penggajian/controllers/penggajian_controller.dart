import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/penggajian_response.dart';
import 'dart:convert';

import 'package:project_ujikom/app/utils/api.dart';

class PenggajianController extends GetxController {
  var isLoading = true.obs;
  var penggajianList = <PenggajianResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPenggajian();
  }

  void fetchPenggajian() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse(
            'http://127.0.0.1:8000/api/penggajian'), 
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        penggajianList.value = List<PenggajianResponse>.from(
          jsonData.map((data) => PenggajianResponse.fromJson(data)),
        );
      } else {
        Get.snackbar("Error", "Gagal memuat data");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading(false);
    }
  }
  Future<void> addPenggajian(PenggajianResponse data) async {
    try {
      final response = await http.post(
        Uri.parse('${BaseUrl.penggajian}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data.toJson()),
      );
      if (response.statusCode == 201) {
        fetchPenggajian();
        Get.snackbar("Sukses", "Data berhasil ditambahkan");
      } else {
        Get.snackbar("Gagal", "Gagal menambahkan data");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan saat menambah data");
    }
  }

  // ✅ UPDATE
  Future<void> updatePenggajian(int id, PenggajianResponse data) async {
    try {
      final response = await http.put(
        Uri.parse('${BaseUrl.penggajian}/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data.toJson()),
      );
      if (response.statusCode == 200) {
        fetchPenggajian();
        Get.snackbar("Sukses", "Data berhasil diperbarui");
      } else {
        Get.snackbar("Gagal", "Gagal memperbarui data");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan saat update");
    }
  }

  // ✅ DELETE
  Future<void> deletePenggajian(int id) async {
    try {
      final response = await http.delete(Uri.parse('${BaseUrl.penggajian}/$id'));
      if (response.statusCode == 200) {
        fetchPenggajian();
        Get.snackbar("Sukses", "Data berhasil dihapus");
      } else {
        Get.snackbar("Gagal", "Gagal menghapus data");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan saat hapus data");
    }
  }
}

