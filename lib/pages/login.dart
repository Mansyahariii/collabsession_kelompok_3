import 'package:collabsession/pages/admin/admin_dashboard.dart';
import 'package:collabsession/pages/user/user_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool _isLoading = false;


  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }
    Future<void> _login() async {
    setState(() => _isLoading = true);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }

   
}
  
