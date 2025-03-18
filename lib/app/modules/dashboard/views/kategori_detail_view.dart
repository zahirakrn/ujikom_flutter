import 'package:flutter/material.dart';

import 'package:get/get.dart';

class KategoriDetailView extends GetView {
  const KategoriDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KategoriDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KategoriDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
