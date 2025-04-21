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
                                showEditDialog(context, controller, pembelian);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                controller.deletePembelian(pembelian.id!);
                                Get.back(); // Menutup dialog setelah delete
                              },
                            ),
                          ],
                        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddDialog(context, controller),
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddDialog(BuildContext context, PembelianController controller) {
    final perusahaanController = TextEditingController();
    final namaController = TextEditingController();
    final jumlahController = TextEditingController();
    final hargaBeliController = TextEditingController();
    final tanggalController = TextEditingController();
    final alamatController = TextEditingController();

    Get.defaultDialog(
      title: "Tambah Pembelian",
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: perusahaanController,
              decoration: const InputDecoration(labelText: "Perusahaan"),
            ),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: "Nama Barang"),
            ),
            TextField(
              controller: jumlahController,
              decoration: const InputDecoration(labelText: "Jumlah"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: hargaBeliController,
              decoration: const InputDecoration(labelText: "Harga Beli"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tanggalController,
              decoration: const InputDecoration(labelText: "Tanggal"),
            ),
            TextField(
              controller: alamatController,
              decoration: const InputDecoration(labelText: "Alamat"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final data = {
                  "nama_perusahaan": perusahaanController.text,
                  "nama": namaController.text,
                  "jumlah": int.tryParse(jumlahController.text) ?? 0,
                  "harga_beli": int.tryParse(hargaBeliController.text) ?? 0,
                  "tanggal": tanggalController.text,
                  "alamat": alamatController.text,
                };

                controller.addPembelian(data);

                // Menampilkan notifikasi setelah berhasil menambah data
                Get.snackbar(
                  "Berhasil",
                  "Pembelian berhasil ditambahkan.",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  duration: const Duration(seconds: 2),
                );

                Get.back(); // Tutup dialog setelah simpan
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }

  void showEditDialog(
      BuildContext context, PembelianController controller, pembelian) {
    final perusahaanController =
        TextEditingController(text: pembelian.namaPerusahaan);
    final namaController = TextEditingController(text: pembelian.nama);
    final jumlahController =
        TextEditingController(text: pembelian.jumlah.toString());
    final hargaBeliController =
        TextEditingController(text: pembelian.hargaBeli.toString());
    final tanggalController = TextEditingController(text: pembelian.tanggal);
    final alamatController = TextEditingController(text: pembelian.alamat);

    Get.defaultDialog(
      title: "Edit Pembelian",
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: perusahaanController,
              decoration: const InputDecoration(labelText: "Perusahaan"),
            ),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: "Nama Barang"),
            ),
            TextField(
              controller: jumlahController,
              decoration: const InputDecoration(labelText: "Jumlah"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: hargaBeliController,
              decoration: const InputDecoration(labelText: "Harga Beli"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tanggalController,
              decoration: const InputDecoration(labelText: "Tanggal"),
            ),
            TextField(
              controller: alamatController,
              decoration: const InputDecoration(labelText: "Alamat"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final updatedData = {
                  "nama_perusahaan": perusahaanController.text,
                  "nama": namaController.text,
                  "jumlah": int.tryParse(jumlahController.text) ?? 0,
                  "harga_beli": int.tryParse(hargaBeliController.text) ?? 0,
                  "tanggal": tanggalController.text,
                  "alamat": alamatController.text,
                };

                controller.updatePembelian(pembelian.id, updatedData);

                // Menampilkan notifikasi setelah berhasil update data
                Get.snackbar(
                  "Berhasil",
                  "Pembelian berhasil diperbarui.",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.blue,
                  colorText: Colors.white,
                  duration: const Duration(seconds: 2),
                );

                Get.back(); // Tutup dialog setelah simpan
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
