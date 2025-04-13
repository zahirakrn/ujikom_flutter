import 'package:get/get.dart';
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
            "http://192.168.162.63:8000/api/profile"), // ganti sesuai endpoint Laravel kamu
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer 55|gNirxqLzR4njVJDsT02CGhEsAJiuxk1bbtb0UHWocbf734bf', // Kalau pakai token
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
}
