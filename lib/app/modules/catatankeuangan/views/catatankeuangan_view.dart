import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/catatankeuangan_controller.dart';

class CatatankeuanganView extends GetView<CatatankeuanganController> {
  const CatatankeuanganView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CatatankeuanganView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CatatankeuanganView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
