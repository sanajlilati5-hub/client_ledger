import 'package:flutter/material.dart';

class InputBalanceField extends StatelessWidget {
  final TextEditingController controller;

  const InputBalanceField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: "الرصيد",
        border: OutlineInputBorder(),
      ),
    );
  }
}
