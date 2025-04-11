import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_ujikom/app/data/profile_response.dart';
import 'package:project_ujikom/app/utils/api.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final box = GetStorage();
  final _getConnect = GetConnect();
  final token = GetStorage().read('access_token');
  final isLoading = false.obs;
   var profile = ProfileResponse().obs;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async {
    print("TOKEN DARI STORAGE: $token");

    
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(
            'http://127.0.0.1:8000/api/profile'), 
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token', 
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        profile.value = ProfileResponse.fromJson(jsonData['data']);
      } else {
        print('Gagal fetch profile: ${response.body}');
      }
    } catch (e) {
      print('Error fetch profile: $e');
    } finally {
      isLoading.value = false;
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