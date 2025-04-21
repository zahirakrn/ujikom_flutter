import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ujikom/app/data/transaksi_response.dart';
import 'dart:convert';
// Import model yang sudah kamu buat

class TransaksiController extends GetxController {
  var transaksiList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransaksi();

  }
    Future<void> fetchTransaksi() async {
      try {
        isLoading(true);
        final response = await http
            .get(Uri.parse('http://127.0.0.1:8000/api/transaksi'));

        if (response.statusCode == 200) {
          print(response.body);
          var jsonResponse = json.decode(response.body) as List<dynamic>;
          transaksiList.value = jsonResponse.map((e) => Data.fromJson(e)).toList();
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        print('Error: $e');
      } finally {
        isLoading(false);
      }
    }
  }

