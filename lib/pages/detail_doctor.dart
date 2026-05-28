import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';

class DetailDoctorPage extends StatelessWidget {
  final String doctorName;
  final String specialist;
  final String image;

  const DetailDoctorPage({
    super.key,
    required this.doctorName,
    required this.specialist,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      appBar: AppBar(title: const Text("Detail Dokter"), centerTitle: true),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            Text(
              doctorName,

              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              specialist,

              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),

            const Padding(
              padding: EdgeInsets.all(16),

              child: Text(
                "Dokter profesional dan berpengalaman dalam menangani pasien dengan pelayanan terbaik.",

                textAlign: TextAlign.center,

                style: TextStyle(fontSize: 16),
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },

              icon: const Icon(Icons.arrow_back),

              label: const Text("Kembali"),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },

                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home, color: Colors.white),
                    SizedBox(height: 5),
                    Text("Home", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.medical_information, color: Colors.white),
                  SizedBox(height: 5),
                  Text("Detail", style: TextStyle(color: Colors.white)),
                ],
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },

                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person, color: Colors.white),
                    SizedBox(height: 5),
                    Text("Profile", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
