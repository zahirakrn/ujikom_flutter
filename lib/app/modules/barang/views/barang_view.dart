import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';

class BarangView extends GetView<BarangController> {
  const BarangView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BarangController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Barang'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.barangList.isEmpty) {
          return const Center(child: Text('Tidak ada data barang'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.barangList.length,
          itemBuilder: (context, index) {
            final barang = controller.barangList[index];

            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Nama Barang: ${barang.pembelian?.nama ?? '-'}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 175, 175, 175),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () =>
                                  controller.showEditDialog(barang),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () =>
                                  controller.deleteBarang(barang.id!),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Nama Kategori: ${barang.kategori?.nama ?? '-'}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Harga Jual: Rp${barang.hargaJual?.toString() ?? '-'}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Stok: ${barang.stok?.toString() ?? '0'} ${barang.unit ?? ''}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
