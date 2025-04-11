import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_ujikom/app/modules/profile/controllers/profile_controller.dart';


class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#e8ecd7'),
      appBar: AppBar(
        backgroundColor: HexColor('#8aa29e'),
        title: const Text('Profil Saya'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.defaultDialog(
                title: "Logout",
                middleText: "Apakah Anda yakin ingin logout?",
                textConfirm: "Ya",
                textCancel: "Batal",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  controller
                      .logout(); // Pastikan ada function ini di controllermu
                },
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final profile = controller.profile.value;
        if (profile.id == null) {
          return const Center(child: Text('Data profil tidak ditemukan.'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: HexColor('#8aa29e'),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildInfoTile("ID", profile.id.toString()),
                      const Divider(),
                      _buildInfoTile("Nama", profile.name ?? "-"),
                      const Divider(),
                      _buildInfoTile("Email", profile.email ?? "-"),
                      const Divider(),
                      _buildInfoTile("Email Terverifikasi",
                          profile.emailVerifiedAt ?? "Belum terverifikasi"),
                      const Divider(),
                      _buildInfoTile("Dibuat pada", profile.createdAt ?? "-"),
                      const Divider(),
                      _buildInfoTile(
                          "Terakhir diperbarui", profile.updatedAt ?? "-"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
