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
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/mison.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 60,
                  left: 16,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ),

                Positioned(
                  bottom: -55,
                  left: 0,
                  right: 0,
                  child: Center(
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
                        backgroundImage: AssetImage('assets/images/mison.jpeg'),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            const Text(
              'Mison Wenda',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    title: 'Kelas',
                    value: 'TI 23 SE P2',
                  ),
                  _buildInfoTile(
                    icon: Icons.code,
                    title: 'NIM',
                    value: '1123150103',
                  ),
                  _buildInfoTile(
                    icon: Icons.timeline,
                    title: 'Keahlian',
                    value: 'UI/UX Designer',
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
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildContactIcon(icon: Icons.email, color: Colors.red),
                      _buildContactIcon(icon: Icons.phone, color: Colors.green),
                      _buildContactIcon(
                        icon: Icons.location_on,
                        color: Colors.blue,
                      ),
                      _buildContactIcon(
                        icon: Icons.language,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }

  _buildContactIcon({required IconData icon, required MaterialColor color}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
