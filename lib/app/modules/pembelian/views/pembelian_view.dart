import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pembelian_controller.dart';

class PembelianView extends GetView<PembelianController> {
  const PembelianView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PembelianController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pembelian'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.pembelianList.isEmpty) {
          return const Center(child: Text('Tidak ada data pembelian.'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.pembelianList.length,
          itemBuilder: (context, index) {
            final pembelian = controller.pembelianList[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header: Nama barang dan tombol aksi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Nama Barang: ${pembelian.nama}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                controller.editPembelian(pembelian);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                controller.deletePembelian(pembelian.id!);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Perusahaan: ${pembelian.namaPerusahaan ?? '-'}',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      'Jumlah: ${pembelian.jumlah} pcs',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      'Harga Beli: Rp${pembelian.hargaBeli?.toStringAsFixed(0) ?? '0'}',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      'Tanggal: ${pembelian.tanggal ?? '-'}',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      'Alamat: ${pembelian.alamat ?? '-'}',
                      style: TextStyle(color: Colors.grey[700]),
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
