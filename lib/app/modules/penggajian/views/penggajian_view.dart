import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/penggajian/controllers/penggajian_controller.dart';

class PenggajianView extends GetView<PenggajianController> {
  const PenggajianView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penggajian'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.penggajianList.isEmpty) {
          return const Center(child: Text('Tidak ada data penggajian.'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.penggajianList.length,
          itemBuilder: (context, index) {
            final item = controller.penggajianList[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  item.namaPegawai ?? 'Tidak ada nama',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gaji: Rp${item.jumlahGaji?.toString() ?? "-"}'),
                    Text('Tanggal: ${item.tanggalGaji ?? "-"}'),
                    Text('Status: ${item.status ?? "-"}'),
                    Text('Kontak: ${item.kontak ?? "-"}'),
                  ],
                ),
                trailing: const Icon(Icons.monetization_on),
              ),
            );
          },
        );
      }),
    );
  }
}
