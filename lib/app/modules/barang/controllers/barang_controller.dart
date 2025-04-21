import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:project_ujikom/app/data/barang_response.dart';
import 'package:project_ujikom/app/utils/api.dart';

class BarangController extends GetxController {
  var barangList = <BarangResponse>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchBarang();
    super.onInit();
  }

  Future<void> fetchBarang() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(BaseUrl.barang));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        barangList.value =
            jsonData.map((e) => BarangResponse.fromJson(e)).toList();
      } else {
        Get.snackbar('Error', 'Gagal mengambil data barang');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }

  // Future<void> updateBarang(int id, String nama, String hargaJual) async {
  //   try {
  //     final response = await http.put(
  //       Uri.parse('${BaseUrl.barang}/$id'),
  //       body: {
  //         'nama_barang': nama,
  //         'harga_jual': hargaJual,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       fetchBarang();
  //       Get.snackbar('Sukses', 'Barang berhasil diperbarui');
  //     } else {
  //       Get.snackbar('Error', 'Gagal memperbarui barang');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'Terjadi kesalahan: $e');
  //   }
  // }

  // Future<void> deleteBarang(int id) async {
  //   Get.defaultDialog(
  //     title: 'Konfirmasi',
  //     middleText: 'Apakah Anda yakin ingin menghapus barang ini?',
  //     textConfirm: 'Ya',
  //     textCancel: 'Batal',
  //     confirmTextColor: Colors.white,
  //     onConfirm: () async {
  //       try {
  //         final response =
  //             await http.delete(Uri.parse('${BaseUrl.barang}/$id'));
  //         if (response.statusCode == 200) {
  //           barangList.removeWhere((barang) => barang.id == id);
  //           Get.snackbar('Sukses', 'Barang berhasil dihapus');
  //         } else {
  //           Get.snackbar('Error', 'Gagal menghapus barang');
  //         }
  //       } catch (e) {
  //         Get.snackbar('Error', 'Terjadi kesalahan: $e');
  //       }
  //       Get.back();
  //     },
  //   );
  // }

  // void showEditDialog(BarangResponse barang) {
  //   final namaController =
  //       TextEditingController(text: barang.pembelian?.nama ?? '');
  //   final hargaController =
  //       TextEditingController(text: barang.hargaJual?.toString() ?? '');

  //   Get.defaultDialog(
  //     title: 'Edit Barang',
  //     content: Column(
  //       children: [
  //         TextField(
  //           controller: namaController,
  //           decoration: const InputDecoration(labelText: 'Nama Barang'),
  //         ),
  //         TextField(
  //           controller: hargaController,
  //           decoration: const InputDecoration(labelText: 'Harga Jual'),
  //           keyboardType: TextInputType.number,
  //         ),
  //       ],
  //     ),
  //     textConfirm: 'Simpan',
  //     textCancel: 'Batal',
  //     confirmTextColor: Colors.white,
  //     onConfirm: () {
  //       updateBarang(
  //         barang.id!,
  //         namaController.text,
  //         hargaController.text,
  //       );
  //       Get.back();
  //     },
  //   );
  // }

  List<BarangResponse> getBarangByKategori(int idKategori) {
    return barangList
        .where((barang) => barang.idKategori == idKategori)
        .toList();
  }

  String getNamaBarang(int? idBarang) {
    final barang = barangList.firstWhereOrNull((b) => b.id == idBarang);
    return barang?.pembelian?.nama ?? 'Barang Tidak Ditemukan';
  }
}
