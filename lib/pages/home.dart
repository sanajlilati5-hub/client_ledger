import 'package:clint_ledger/widgets/ClientCard.dart';
import 'package:clint_ledger/widgets/WelcomeCard.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // مؤقتاً – قائمة عملاء تجريبية قبل الربط مع Supabase
  List<Map<String, dynamic>> clients = [];
  Future<void> loadclients() async {
    final data = await Supabase.instance.client.from("clients").select();
    setState(() {
      clients = List<Map<String, dynamic>>.from(data);
    });
  }

  @override
  void initState() {
    super.initState();
    loadclients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add-client");
        },
        backgroundColor: const Color(0xff073c69),
        child: const Icon(Icons.add, size: 28, color: Colors.white),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "العملاء",
          style: TextStyle(
            color: Color(0xff073c69),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const WelcomeCard(),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: clients.length,
                itemBuilder: (context, index) {
                  final client = clients[index];
                  return ClientCard(client: client);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
