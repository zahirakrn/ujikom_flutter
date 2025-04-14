import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/barang/views/barang_view.dart';
import 'package:project_ujikom/app/modules/catatankeuangan/views/catatankeuangan_view.dart';
import 'package:project_ujikom/app/modules/catatanstok/views/catatanstok_view.dart';
import 'package:project_ujikom/app/modules/kategori/views/kategori_view.dart';
import 'package:project_ujikom/app/modules/pembelian/views/pembelian_view.dart';
import 'package:project_ujikom/app/modules/transaksi/views/transaksi_view.dart';
import 'package:project_ujikom/app/modules/penggajian/views/penggajian_view.dart';
import '../controllers/dashboard_controller.dart';

class IndexView extends GetView<DashboardController> {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting + Notifikasi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _getGreeting(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Stack(
                    children: [
                      const Icon(Icons.notifications_none, size: 26),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Grid Kecil
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // <- Lebih kecil karena 3 kolom
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1, // Kotak persegi
                  ),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final items = [
                      {
                        'icon': Icons.category,
                        'title': 'Kategori',
                        'color': const Color(0xFF037A41),
                        'page': const KategoriView()
                      },
                      {
                        'icon': Icons.inventory,
                        'title': 'Barang',
                        'color': const Color(0xFF39777D),
                        'page': const BarangView()
                      },
                      {
                        'icon': Icons.monetization_on,
                        'title': 'Pembelian',
                        'color': const Color(0xFFFAC915),
                        'page': const PembelianView()
                      },
                      {
                        'icon': Icons.receipt_long,
                        'title': 'Transaksi',
                        'color': const Color(0xFFFF5C4D),
                        'page': TransaksiView()
                      },
                       {
                        'icon': Icons.account_balance_wallet_rounded,
                        'title': 'Penggajian',
                        'color': Color.fromARGB(255, 22, 70, 110),
                        'page': const PenggajianView()
                      },
                       {
                        'icon': Icons.find_in_page_outlined,
                        'title': 'Catatan Stok',
                        'color': Color.fromARGB(255, 104, 64, 107),
                        'page': const CatatanstokView()
                      },
                       {
                        'icon': Icons.aod_outlined,
                        'title': 'Catatan Keuangan',
                        'color': Color.fromARGB(255, 151, 25, 33),
                        'page': const CatatankeuanganView()
                      },
                    ];
                    return _buildDashboardCard(
                      context,
                      icon: items[index]['icon'] as IconData,
                      title: items[index]['title'] as String,
                      color: items[index]['color'] as Color,
                      page: items[index]['page'] as Widget,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat pagi, Admin!';
    } else if (hour < 15) {
      return 'Selamat siang, Admin!';
    } else if (hour < 18) {
      return 'Selamat sore, Admin!';
    } else {
      return 'Selamat malam, Admin!';
    }
  }

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
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: color),
              const SizedBox(height: 6),
              Text(
                title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
