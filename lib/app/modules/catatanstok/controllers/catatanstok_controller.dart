import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_ujikom/app/data/catatanstok_response.dart';  

class CatatanstokController extends GetxController {
  
  var catatanStoks = <CatatanStokResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCatatanStok();
  }

  
  Future<void> fetchCatatanStok() async {
    try {
     
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/catatanstok'));

      if (response.statusCode == 200) { 
        List jsonResponse = json.decode(response.body);
        catatanStoks.value = jsonResponse.map((item) => CatatanStokResponse.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load catatan stok');
      }
    } catch (e) {
      
      print("Error fetching catatan stok: $e");
    }
  }
}
