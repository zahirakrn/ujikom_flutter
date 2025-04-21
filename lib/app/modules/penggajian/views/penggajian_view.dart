import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/data/penggajian_response.dart';
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.orange),
                      onPressed: () {
                        _showFormDialog(context, data: item, id: item.id);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Hapus Data",
                          middleText: "Yakin ingin menghapus data ini?",
                          onConfirm: () {
                            controller.deletePenggajian(item.id!);
                            Get.back();
                          },
                          onCancel: () {},
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFormDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showFormDialog(BuildContext context, {PenggajianResponse? data, int? id}) {
    final namaController = TextEditingController(text: data?.namaPegawai ?? '');
    final gajiController =
        TextEditingController(text: data?.jumlahGaji?.toString() ?? '');
    final tanggalController =
        TextEditingController(text: data?.tanggalGaji ?? '');
    final statusController = TextEditingController(text: data?.status ?? '');
    final kontakController = TextEditingController(text: data?.kontak ?? '');

    Get.defaultDialog(
      title: id == null ? "Tambah Penggajian" : "Edit Penggajian",
      content: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField("Nama", namaController),
            _buildTextField("Jumlah Gaji", gajiController,
                inputType: TextInputType.number),
            _buildTextField("Tanggal Gaji", tanggalController),
            _buildTextField("Status", statusController),
            _buildTextField("Kontak", kontakController),
          ],
        ),
      ),
      textConfirm: id == null ? "Tambah" : "Update",
      textCancel: "Batal",
      onConfirm: () {
        final newData = PenggajianResponse(
          namaPegawai: namaController.text,
          jumlahGaji: int.tryParse(gajiController.text) ?? 0,
          tanggalGaji: tanggalController.text,
          status: statusController.text,
          kontak: kontakController.text,
        );

        if (id == null) {
          controller.addPenggajian(newData);
        } else {
          controller.updatePenggajian(id, newData);
        }

        Get.back();
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
