import 'package:clint_ledger/pages/authpage.dart';
import 'package:clint_ledger/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      return const HomePage();
    } else {
      return const AuthPage();
    }
  }
}
