import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KategoriController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.kategoriList.isEmpty) {
          return const Center(child: Text('Tidak ada data kategori'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.kategoriList.length,
          itemBuilder: (context, index) {
            final kategori = controller.kategoriList[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: const Icon(Icons.category, color: Colors.blue),
                title: Text(kategori.nama),
                subtitle: Text(
                  'ID: ${kategori.id} • Dibuat: ${kategori.createdAt}',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                onTap: () {
                  Get.snackbar('Kategori Dipilih', kategori.nama);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
