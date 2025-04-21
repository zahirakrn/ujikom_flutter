import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kategori_controller.dart';
import '../../barang/controllers/barang_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({super.key});

  @override
  Widget build(BuildContext context) {
    final kategoriController = Get.put(KategoriController());
    final barangController = Get.put(BarangController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (kategoriController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (kategoriController.kategoriList.isEmpty) {
          return const Center(child: Text('Tidak ada data kategori'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: kategoriController.kategoriList.length,
          itemBuilder: (context, index) {
            final kategori = kategoriController.kategoriList[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: const Icon(Icons.category, color: Colors.blue),
                title: Text(kategori.nama),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.orange),
                      onPressed: () => showEditDialog(
                        context,
                        kategoriController,
                        kategori.id,
                        kategori.nama,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () =>
                          kategoriController.deleteKategori(kategori.id),
                    ),
                  ],
                ),
                onTap: () {
                  showKategoriModal(
                    context,
                    kategori.id,
                    kategori.nama,
                    barangController,
                  );
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddDialog(context, kategoriController);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showKategoriModal(
    BuildContext context,
    int idKategori,
    String namaKategori,
    BarangController barangController,
  ) {
    final barangDalamKategori =
        barangController.getBarangByKategori(idKategori);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Barang dalam kategori: $namaKategori'),
          content: SizedBox(
            width: double.maxFinite,
            child: barangDalamKategori.isEmpty
                ? const Center(
                    child: Text('Tidak ada barang dalam kategori ini'))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: barangDalamKategori.length,
                    itemBuilder: (context, index) {
                      final barang = barangDalamKategori[index];
                      return ListTile(
                        title: Text(barang.pembelian?.nama ?? ''),
                        subtitle: Text(
                          'Stok: ${barang.stok ?? '0'} ${barang.unit ?? ''}',
                        ),
                      );
                    },
                  ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  void showEditDialog(
    BuildContext context,
    KategoriController controller,
    int id,
    String nama,
  ) {
    TextEditingController namaController = TextEditingController(text: nama);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Kategori'),
          content: TextField(
            controller: namaController,
            decoration: const InputDecoration(labelText: 'Nama Kategori'),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                controller.updateKategori(id, namaController.text);
                Get.back();
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void showAddDialog(
    BuildContext context,
    KategoriController controller,
  ) {
    TextEditingController namaController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Kategori'),
          content: TextField(
            controller: namaController,
            decoration: const InputDecoration(labelText: 'Nama Kategori'),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                controller.addKategori(namaController.text);
                Get.back();
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }
}
