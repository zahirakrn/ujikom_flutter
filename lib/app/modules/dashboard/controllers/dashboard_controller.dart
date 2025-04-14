import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_ujikom/app/data/kategori_response.dart';
import 'package:project_ujikom/app/modules/dashboard/views/index_view.dart';
import 'package:project_ujikom/app/modules/dashboard/views/profile_view.dart';
import 'package:project_ujikom/app/modules/transaksi/views/transaksi_view.dart';
import 'package:project_ujikom/app/utils/api.dart';

class DashboardController extends GetxController {
  final _getConnect = GetConnect();
  final token = GetStorage().read('token');

  Future<KategoriResponse> getKategori() async {
    final response = await _getConnect.get(
      BaseUrl.kategoris,
      headers: {'Authorization': "Bearer $token"},
      contentType: "application/json",
    );
    return KategoriResponse.fromJson(response.body);
  }

  var yourKategoris = <KategoriResponse>[].obs;

  Future<void> getYourKategori() async {
    final response = await _getConnect.get(
      BaseUrl.yourKategori,
      headers: {'Authorization': "Bearer $token"},
      contentType: "application/json",
    );
    final kategoriResponse = KategoriResponse.fromJson(response.body);
    yourKategoris.add(kategoriResponse);
  }

  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    IndexView(),
    ProfileView(),
    TransaksiView(),
  ];

  @override
  void onInit() {
    getKategori();
    getYourKategori();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
