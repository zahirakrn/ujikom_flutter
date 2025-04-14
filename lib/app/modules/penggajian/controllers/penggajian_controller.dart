import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/penggajian_response.dart';
import 'dart:convert';

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
            'http://192.168.0.177:8000/api/penggajian'), 
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
}
