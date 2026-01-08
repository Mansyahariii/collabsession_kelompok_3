import 'package:flutter/material.dart';

class ProfilePage1 extends StatelessWidget {
  const ProfilePage1({super.key});

  final String bgAsset = "assets/images/bgpicture.jpg";
  final String profileAsset = "assets/images/profilepicture.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Stack(children: [])),
    );
  }
}
