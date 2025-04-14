import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/catatanstok/controllers/catatanstok_controller.dart';

class CatatanstokView extends GetView<CatatanstokController> {
  const CatatanstokView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Stok'),
        centerTitle: true,
      ),
      body: Obx(() {
      
        if (controller.catatanStoks.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

       
        return ListView.builder(
          itemCount: controller.catatanStoks.length,
          itemBuilder: (context, index) {
            final catatanStok = controller.catatanStoks[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(catatanStok.jenis ?? 'Jenis Tidak Tersedia'),
                subtitle: Text(
                    'Tanggal: ${catatanStok.tanggal} - Jumlah: ${catatanStok.jumlah}'),
                trailing: Text('Stok Barang: ${catatanStok.barang?.stok ?? 0}'),
              ),
            );
          },
        );
      }),
    );
  }
}
