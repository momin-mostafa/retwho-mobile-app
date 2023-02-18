import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:retwho/app/data/controller/auth/auth_controller.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Card(
            child: ListTile(
              leading: Icon(Icons.document_scanner_rounded),
              title: Text('Support Documents'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.message),
              title: Text('Live Chat'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.qr_code_scanner_outlined),
              title: Text('Disable Blutooth Scanner'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.update_outlined),
              title: Text('Force OTA Update'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.policy_outlined),
              title: Text('Privacy Policy'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: AuthController.instance.signOut,
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
