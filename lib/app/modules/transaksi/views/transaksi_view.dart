import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/transaksi/controllers/transaksi_controller.dart';

class TransaksiView extends GetView<TransaksiController> {
  const TransaksiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Transaksi'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transaksiList.isEmpty) {
          return const Center(child: Text('Tidak ada data transaksi'));
        }

        return ListView.builder(
          itemCount: controller.transaksiList.length,
          itemBuilder: (context, index) {
            final transaksi = controller.transaksiList[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaksi.nama ?? 'Tanpa Nama',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tanggal: ${transaksi.tanggal}"),
                        Text("Jenis: ${transaksi.jenis}"),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text("Total: Rp ${transaksi.total}"),
                    const Divider(),
                    if (transaksi.barangs != null &&
                        transaksi.barangs!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: transaksi.barangs!.map((barang) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Barang: ${barang.kodeBarang ?? '-'}'),
                                Text('Jumlah: ${barang.pivot?.jumlah ?? 0}'),
                                Text(
                                    'Subtotal: Rp ${barang.pivot?.subtotal ?? '0'}'),
                              ],
                            ),
                          );
                        }).toList(),
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
