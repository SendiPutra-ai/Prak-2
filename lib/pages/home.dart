import 'package:flutter/material.dart';
import 'detail_doctor.dart';
import 'profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> doctors = const [
    {
      "name": "Dr. Andi Saputra",
      "specialist": "Spesialis Jantung",
      "image": "assets/images/d1.jpeg",
    },
    {
      "name": "Dr. Budi Santoso",
      "specialist": "Spesialis Anak",
      "image": "assets/images/d2.jpeg",
    },
    {
      "name": "Dr. Clara Wijaya",
      "specialist": "Spesialis Mata",
      "image": "assets/images/d3.jpeg",
    },
    {
      "name": "Dr. Dimas Putra",
      "specialist": "Spesialis THT",
      "image": "assets/images/d4.jpeg",
    },
    {
      "name": "Dr. Eka Lestari",
      "specialist": "Spesialis Kulit",
      "image": "assets/images/d5.jpeg",
    },
    {
      "name": "Dr. Farhan Yusuf",
      "specialist": "Spesialis Gigi",
      "image": "assets/images/d6.jpeg",
    },
    {
      "name": "Dr. Gina Marlina",
      "specialist": "Spesialis Saraf",
      "image": "assets/images/d7.jpeg",
    },
    {
      "name": "Dr. Hendra Wijoyo",
      "specialist": "Spesialis Bedah",
      "image": "assets/images/d8.jpeg",
    },
    {
      "name": "Dr. Intan Permata",
      "specialist": "Spesialis Kandungan",
      "image": "assets/images/d9.jpeg",
    },
    {
      "name": "Dr. Joko Prasetyo",
      "specialist": "Dokter Umum",
      "image": "assets/images/d10.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      appBar: AppBar(title: const Text("Medical App"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: GridView.builder(
          itemCount: doctors.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),

          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailDoctorPage(
                      doctorName: doctors[index]["name"]!,
                      specialist: doctors[index]["specialist"]!,
                      image: doctors[index]["image"]!,
                    ),
                  ),
                );
              },

              child: Card(
                elevation: 6,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),

                      child: Image.asset(
                        doctors[index]["image"]!,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      doctors[index]["name"]!,

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      doctors[index]["specialist"]!,

                      textAlign: TextAlign.center,

                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
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
                  Icon(Icons.medical_services, color: Colors.white),
                  SizedBox(height: 5),
                  Text("Doctor", style: TextStyle(color: Colors.white)),
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
