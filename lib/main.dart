import 'package:clint_ledger/pages/AddClientPage.dart';
import 'package:clint_ledger/pages/authpage.dart';
import 'package:clint_ledger/pages/home.dart';
import 'package:clint_ledger/pages/onescreen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFmYnR3ZGhtYW1tZnJneHF3YW5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ3MDI0MzIsImV4cCI6MjA4MDI3ODQzMn0.rkms9714Z5rVpXppjPSv6oUMsxTMJH8OgdO1g-sAo9Y",
      url: "https://qfbtwdhmammfrgxqwano.supabase.co");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "screen",
      routes: {
        "screen": (context) => const Onescreen(),
        "/": (context) => const HomePage(),
        "/add-client": (context) => const AddClientPage(),
      },
    );
  }
}
