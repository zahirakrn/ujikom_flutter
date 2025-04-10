import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/profile/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: controller.logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          final user = controller.userProfile;


          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileItem('Name', user['name']),
              _buildProfileItem('Email', user['email']),
              _buildProfileItem('Joined', user['created_at']),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildProfileItem(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Flexible(
            child: Text(
              value ?? '-',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
