import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/pembelian_response.dart';
import 'dart:convert';
import 'package:project_ujikom/app/utils/api.dart';

class PembelianController extends GetxController {
  var pembelianList = <Data>[].obs;
  var isLoading = true.obs;

  // Tambahan: controller untuk form
  final namaC = TextEditingController();
  final jumlahC = TextEditingController();
  final hargaBeliC = TextEditingController();
  final alamatC = TextEditingController();

  @override
  void onInit() {
    fetchPembelian();
    super.onInit();
  }

  Future<void> fetchPembelian() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(BaseUrl.pembelian));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var pembelianData = PembelianResponse.fromJson(jsonResponse);

        if (pembelianData.data != null) {
          pembelianList.value = pembelianData.data!;
        }
      } else {
        Get.snackbar('Error', 'Gagal mengambil data pembelian');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addPembelian(Map<String, dynamic> data) async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse(BaseUrl.pembelian),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      if (response.statusCode == 201) {
        // optional: tampilkan notifikasi
        Get.snackbar("Sukses", "Data pembelian berhasil ditambahkan");

        // fetch ulang data dari API
        await fetchPembelian();
      } else {
        final msg =
            json.decode(response.body)['message'] ?? "Gagal menambahkan";
        Get.snackbar("Error", msg);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatePembelian(int id, Map<String, dynamic> data) async {
    try {
      isLoading.value = true;

      final response = await http.put(
        Uri.parse('${BaseUrl.pembelian}/$id'), // sesuaikan URL
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Berhasil", "Data berhasil diperbarui");
        await fetchPembelian(); // refresh list
      } else {
        final msg = json.decode(response.body)['message'] ?? "Gagal update";
        Get.snackbar("Error", msg);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deletePembelian(int id) async {
    try {
      final response = await http.delete(Uri.parse('${BaseUrl.pembelian}/$id'));

      if (response.statusCode == 200) {
        pembelianList.removeWhere((element) => element.id == id);
        Get.snackbar("Sukses", "Data pembelian dihapus");
      } else {
        Get.snackbar("Error", "Gagal menghapus data");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
