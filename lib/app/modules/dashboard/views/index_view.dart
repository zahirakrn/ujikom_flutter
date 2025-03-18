import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/kategori/views/kategori_view.dart';
import 'package:project_ujikom/app/modules/transaksi/views/transaksi_view.dart';
import '../controllers/dashboard_controller.dart';

class IndexView extends GetView<DashboardController> {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tb Kurnia Jaya',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 194, 235, 195),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat datang di TB Kurnia Jaya, Admin!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Grid Menu Cards (Dibuat lebih rapat)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 8, // Jarak horizontal antar kotak
                mainAxisSpacing: 8, // Jarak vertikal antar kotak
                children: [
                  _buildDashboardCard(
                    context,
                    icon: Icons.inventory,
                    title: 'Kategori',
                    color: Colors.greenAccent,
                    page: const KategoriView(),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.receipt_long,
                    title: 'Transaksi',
                    color: Colors.amberAccent,
                    page: const TransaksiView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Card Menu Dashboard
  Widget _buildDashboardCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required Widget page,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
