import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/transaksi/controllers/transaksi_controller.dart';


class TransaksiView extends GetView<TransaksiController> {
  const TransaksiView({super.key});

  @override
  Widget build(BuildContext context) {
     final transaksiController = Get.put(TransaksiController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Transaksi'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.transaksiList.isEmpty
                ? const Center(child: Text('Tidak ada transaksi'))
                : ListView.builder(
                    itemCount: controller.transaksiList.length,
                    itemBuilder: (context, index) {
                      final transaksi = controller.transaksiList[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          title: Text(transaksi.nama ?? 'Tanpa Nama'),
                          subtitle: Text('Total: ${transaksi.total}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => controller.deleteTransaksi(transaksi.id!),
                          ),
                        ),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, 
        child: const Icon(Icons.add),
      ),
    );
  }
}
