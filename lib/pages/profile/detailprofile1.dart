import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ProfilePage1 extends StatelessWidget {
  const ProfilePage1({super.key});

  final String bgAsset = "assets/images/bgpicture.jpg";
  final String profileAsset = "assets/images/profilepicture.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(bgAsset),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const HeroIcon(HeroIcons.chevronLeft, size: 20),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -55,
                  left: 25,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 5),
                          image: DecorationImage(
                            image: AssetImage(profileAsset),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 8, right: 8),
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ari Firmansyah",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfo("Nim", "1123150127"),
                      _buildInfo("Kelas", "TI SE 23 P"),
                      _buildInfo("Keahlian", "UI/UX Design"),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "About Me",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Ini adalah deskripsi tentang saya. Saya seorang mahasiswa yang sedang belajar Flutter di semester 5. Saya sangat senang belajar Flutter karena Flutter sangat menyenangkan dan mudah untuk dipelajari.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
