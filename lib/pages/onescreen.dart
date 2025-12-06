import 'package:clint_ledger/pages/authpage.dart';
import 'package:flutter/material.dart';

class Onescreen extends StatefulWidget {
  const Onescreen({super.key});

  @override
  State<Onescreen> createState() => _OnescreenState();
}

class _OnescreenState extends State<Onescreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AuthPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFEFE),
        body: Column(
          children: [
            SizedBox(
              height: 160,
            ),
            Center(
              child: Image.asset("assets/images/log.png", height: 130),
            ),
            SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(
              color: Color(0xff073c69),
            ),
          ],
        ));
  }
}
