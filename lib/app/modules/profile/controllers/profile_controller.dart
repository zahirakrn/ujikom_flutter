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
            "http://192.168.0.177:8000/api/profile"), 
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer 76|mDfIoEm85cmwjNgGmQzsQjWDfp1KKW6sAunYYs0v25c34bf1', 
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
