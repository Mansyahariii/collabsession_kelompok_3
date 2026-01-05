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
     try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim(),
      );

      final user = credential.user;
      if (user == null) {
        throw Exception('Login gagal');
      }

      final uid = user.uid;
      final supabase = Supabase.instance.client;

      final profile = await supabase
          .from('profiles')
          .select()
          .eq('firebase_uid', uid)
          .maybeSingle();

      if (profile == null) {
        await supabase.from('profiles').insert({
          'firebase_uid': uid,
          'name': user.email ?? 'Mahasiswa',
          'role': 'user',
        });
      }

      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        await supabase
            .from('profiles')
            .update({'fcm_token': fcmToken})
            .eq('firebase_uid', uid);
      }

      final updatedProfile = await supabase
          .from('profiles')
          .select()
          .eq('firebase_uid', uid)
          .single();

      final role = updatedProfile['role'];

      if (!mounted) return;

      if (role == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AdminDashboard()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const UserDashboard()),
        );
      }
    } on FirebaseAuthException catch (e) {
      _showError(e.message ?? 'Login gagal');
    } catch (e) {
      _showError(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
   void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, top: 8.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(60, 24),
              ),
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
            ),
            )
        ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,)
          )
        ),
    );
  }


}

  

   

  
