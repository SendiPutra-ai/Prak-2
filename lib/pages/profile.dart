import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<UserData>('pendaftaran');
    final user = box.isNotEmpty ? box.values.last : null;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: const Color(0xFF7BAE8E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0xFF7BAE8E).withOpacity(0.2),
              child: const Icon(
                Icons.person,
                size: 70,
                color: Color(0xFF7BAE8E),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              user?.nama ?? "Nama Tidak Tersedia",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              user?.nbi ?? "NBI Tidak Tersedia",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              user?.email ?? "_",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
