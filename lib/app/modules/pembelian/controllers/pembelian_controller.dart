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

  void editPembelian(Data pembelian) {
 
    namaC.text = pembelian.nama ?? '';
    jumlahC.text = pembelian.jumlah?.toString() ?? '';
    hargaBeliC.text = pembelian.hargaBeli?.toString() ?? '';
    alamatC.text = pembelian.alamat ?? '';

    showEditDialog(pembelian.id!);
  }

  void showEditDialog(int id) {
    Get.defaultDialog(
      title: 'Edit Pembelian',
      content: Column(
        children: [
          TextField(
            controller: namaC,
            decoration: const InputDecoration(labelText: 'Nama Barang'),
          ),
          TextField(
            controller: jumlahC,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Jumlah'),
          ),
          TextField(
            controller: hargaBeliC,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Harga Beli'),
          ),
          TextField(
            controller: alamatC,
            decoration: const InputDecoration(labelText: 'Alamat'),
          ),
        ],
      ),
      textConfirm: 'Simpan',
      textCancel: 'Batal',
      confirmTextColor: Colors.white,
      onConfirm: () {
        updatePembelian(id);
        Get.back(); // tutup dialog
      },
    );
  }

  void updatePembelian(int id) async {
    try {
      final response = await http.put(
        Uri.parse('${BaseUrl.pembelian}/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "nama": namaC.text,
          "jumlah": int.tryParse(jumlahC.text) ?? 0,
          "harga_beli": int.tryParse(hargaBeliC.text) ?? 0,
          "alamat": alamatC.text,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Berhasil', 'Data berhasil diperbarui');
        fetchPembelian(); 
      } else {
        Get.snackbar('Gagal', 'Gagal update data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    }
  }

  void deletePembelian(int id) async {
    final confirm = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Yakin ingin menghapus data ini?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        final response =
            await http.delete(Uri.parse('${BaseUrl.pembelian}/$id'));

        if (response.statusCode == 200) {
          pembelianList.removeWhere((item) => item.id == id);
          Get.snackbar('Sukses', 'Data berhasil dihapus');
        } else {
          Get.snackbar('Gagal', 'Tidak dapat menghapus data');
        }
      } catch (e) {
        Get.snackbar('Error', 'Terjadi kesalahan: $e');
      }
    }
  }
}
