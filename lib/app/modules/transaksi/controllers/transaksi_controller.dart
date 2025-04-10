import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/transaksi_response.dart';
import 'package:project_ujikom/app/utils/api.dart';
import 'dart:convert';

class TransaksiController extends GetxController {
  var isLoading = false.obs;
  var transaksiList = <TransaksiResponse>[].obs;

  @override
  void onInit() {
    fetchTransaksi();
    super.onInit();
  }

  Future<void> fetchTransaksi() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(BaseUrl.transaksi));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        transaksiList.value = data.map((e) => TransaksiResponse.fromJson(e)).toList();
      } else {
        Get.snackbar('Error', 'Gagal mengambil data transaksi');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addTransaksi(Map<String, dynamic> transaksiData) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(BaseUrl.transaksi),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(transaksiData),
      );
      if (response.statusCode == 201) {
        fetchTransaksi();
        Get.snackbar('Success', 'Transaksi berhasil ditambahkan');
      } else {
        Get.snackbar('Error', 'Gagal menambahkan transaksi');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteTransaksi(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(Uri.parse(BaseUrl.transaksi));
      if (response.statusCode == 200) {
        transaksiList.removeWhere((item) => item.id == id);
        Get.snackbar('Success', 'Transaksi berhasil dihapus');
      } else {
        Get.snackbar('Error', 'Gagal menghapus transaksi');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }
}
