import 'package:collabsession/firebase_options.dart';
import 'package:collabsession/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://qwdksuawlhdurxbtikli.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3ZGtzdWF3bGhkdXJ4YnRpa2xpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYyOTY5NDgsImV4cCI6MjA4MTg3Mjk0OH0.UHTzyl3mk5jpJrEbnqSO1pSzfFtnHzwU8Ru3hUtIAAY',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Firebase Login",
      home: MyLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}
