import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff073c69),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        "أهلاً بك 👋\nأدر عملاءك وتابع أرصدتهم بكل سهولة",
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          height: 1.4,
        ),
      ),
    );
  }
}
