import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_ujikom/app/data/profile_response.dart';


class ProfileController extends GetxController {
  var isLoading = true.obs;
  var profile = ProfileResponse().obs;


  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse(
            "http://127.0.0.1:8000/api/profile"), 
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer 106|5fr7zWGCifYywZ2AiKpgtQnlbaSxWpDG69Ph9iwF97d64d61', 
        },
      );

      if (response.statusCode == 200) {
        final jsonResult = json.decode(response.body);
        profile.value = ProfileResponse.fromJson(jsonResult);
      } else {
        Get.snackbar("Error", "Gagal memuat profil (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
   @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> logout() async {
    try {
      final box = GetStorage();
      box.remove('token');

      print("Berhasil logout!");

      Get.offAllNamed('/login'); // arahkan ke halaman login
    } catch (e) {
      print("Error saat logout: $e");
    }
  }
}
