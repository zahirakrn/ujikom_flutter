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
}
