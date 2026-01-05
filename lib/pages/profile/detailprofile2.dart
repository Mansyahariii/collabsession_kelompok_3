import 'package:flutter/material.dart';

class Detileprofile2 extends StatelessWidget {
  const Detileprofile2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E3A8A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -55,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(
                        'assets/images/WhatsApp Image 2026-01-05 at 13.50.29.jpeg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),

            const Text(
              'Mison Wenda',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
           Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
           ),
           child: const Text(
                'Mahasiswa Teknik Informatika',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
           ),
          const SizedBox(height: 20),
           
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                  _buildInfoTile(
                    icon: Icons.school,
                    title: 'Kampus',
                    value:
                        'Global Institute | Institut Teknologi dan Bisnis Bina Sarana Global',
                  ),
                   _buildInfoTile(
                    icon: Icons.computer,
                    title: 'Jurusan',
                    value: 'Teknik Informatika',
                  ),
                   _buildInfoTile(
                    icon: Icons.code,
                    title: 'Konsentrasi',
                    value: 'Software Engineering',
                  ),
                   _buildInfoTile(
                    icon: Icons.timeline,
                    title: 'Semester',
                    value: '5',
                  ),
                   _buildInfoTile(
                    icon: Icons.calendar_today,
                    title: 'Angkatan',
                    value: '2023',
                  ),
              ],
            ),
           ),
          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                   boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                    ),
                    
                  ],
          ),
          child: const Text(
                  "Mahasiswa Teknik Informatika dengan konsentrasi Software Engineering yang memiliki minat dalam pengembangan aplikasi dan teknologi digital. Fokus pada pembuatan sistem yang efisien, terstruktur, dan mudah digunakan.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14, height: 1.6),
                ),
          ),
          
          ),
            const SizedBox(height: 20),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kontak',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                ]
              ),
             ),
           
          ],
        ),
      ),
    );
  }
  
  _buildInfoTile({required IconData icon, required String title, required String value}) {}
}
