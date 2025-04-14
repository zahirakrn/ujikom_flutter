import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/transaksi/controllers/transaksi_controller.dart';


class TransaksiView extends GetView<TransaksiController> {
  const TransaksiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransaksiView'),
        centerTitle: true,
      ),
      body: Obx(() {
        // Memeriksa apakah data sedang loading
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
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(transaksi.nama ?? 'Nama Tidak Tersedia'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tanggal: ${transaksi.tanggal}'),
                    Text('Jenis: ${transaksi.jenis}'),
                    Text('Total: ${transaksi.total}'),
                    if (transaksi.barangs != null &&
                        transaksi.barangs!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: transaksi.barangs!.map((barang) {
                          return Text(
                              'Barang: ${barang.kodeBarang} - Stok: ${barang.stok}');
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
