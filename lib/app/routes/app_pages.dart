import 'package:get/get.dart';

import '../modules/barang/bindings/barang_binding.dart';
import '../modules/barang/views/barang_view.dart';
import '../modules/catatankeuangan/bindings/catatankeuangan_binding.dart';
import '../modules/catatankeuangan/views/catatankeuangan_view.dart';
import '../modules/catatanstok/bindings/catatanstok_binding.dart';
import '../modules/catatanstok/views/catatanstok_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboard/views/profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kategori/bindings/kategori_binding.dart';
import '../modules/kategori/views/kategori_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pembelian/bindings/pembelian_binding.dart';
import '../modules/pembelian/views/pembelian_view.dart';
import '../modules/penggajian/bindings/penggajian_binding.dart';
import '../modules/penggajian/views/penggajian_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/transaksi/bindings/transaksi_binding.dart';
import '../modules/transaksi/views/transaksi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      children: [
        GetPage(
          name: _Paths.KATEGORI,
          page: () => const KategoriView(),
          binding: KategoriBinding(),
        ),
        GetPage(
          name: _Paths.BARANG,
          page: () => BarangView(),
          binding: BarangBinding(),
          children: [
            GetPage(
              name: _Paths.BARANG,
              page: () => const BarangView(),
              binding: BarangBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.PEMBELIAN,
          page: () => const PembelianView(),
          binding: PembelianBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.TRANSAKSI,
          page: () => TransaksiView(),
          binding: TransaksiBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PENGGAJIAN,
      page: () => const PenggajianView(),
      binding: PenggajianBinding(),
    ),
    GetPage(
      name: _Paths.CATATANSTOK,
      page: () => const CatatanstokView(),
      binding: CatatanstokBinding(),
    ),
    GetPage(
      name: _Paths.CATATANKEUANGAN,
      page: () => const CatatankeuanganView(),
      binding: CatatankeuanganBinding(),
    ),
  ];
}
