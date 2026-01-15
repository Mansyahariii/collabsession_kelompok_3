import 'package:collabsession/pages/admin/admin_dashboard.dart';
import 'package:collabsession/pages/logo.dart'; // Splashfull
import 'package:collabsession/pages/user/user_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:collabsession/pages/splashscreen1.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  Widget build(BuildContext context) {
    return Splashfull(
      onAnimationComplete: () async {
        final user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const SplashScreen()),
          );
          return;
        }

        Map<String, dynamic>? profile;
        try {
          profile = await Supabase.instance.client
              .from('profiles')
              .select('role')
              .eq('firebase_uid', user.uid)
              .maybeSingle();
        } catch (_) {
          profile = null;
        }

        final role = profile?['role'] ?? 'user';

        if (!mounted) return;

        final nextPage = role == 'admin'
            ? const AdminDashboard()
            : const UserDashboard();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => nextPage),
        );
      },
    );
  }
}

