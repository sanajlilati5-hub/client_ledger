import 'package:clint_ledger/widgets/CurrencyDropdown.dart';
import 'package:clint_ledger/widgets/SubmitButton.dart';
import 'package:clint_ledger/widgets/TypeDropdown.dart';
import 'package:clint_ledger/widgets/nputBalanceField.dart';
import 'package:clint_ledger/widgets/nputNameField.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddClientPage extends StatefulWidget {
  const AddClientPage({super.key});

  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  final nameController = TextEditingController();
  final balanceController = TextEditingController();

  String selectedType = "لنا";
  String selectedCurrency = "SYP";

  bool isLoading = false;

  Future<void> addClient() async {
    if (nameController.text.isEmpty || balanceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يرجى ملء جميع الحقول")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      await Supabase.instance.client.from("clients").insert({
        "name": nameController.text,
        "balance": double.parse(balanceController.text),
        "type": selectedType,
        "currency": selectedCurrency,
      });

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("خطأ: $e")),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xff073c69),
        title: const Text(
          "إضافة عميل",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InputNameField(controller: nameController),
            const SizedBox(height: 20),
            InputBalanceField(controller: balanceController),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TypeDropdown(
                    selected: selectedType,
                    onChanged: (val) => setState(() => selectedType = val),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CurrencyDropdown(
                    selected: selectedCurrency,
                    onChanged: (val) => setState(() => selectedCurrency = val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SubmitButton(
              isLoading: isLoading,
              onPressed: addClient,
            )
          ],
        ),
      ),
    );
  }
}
