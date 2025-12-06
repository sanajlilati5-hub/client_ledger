import 'package:flutter/material.dart';

class InputNameField extends StatelessWidget {
  final TextEditingController controller;

  const InputNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right,
      controller: controller,
      decoration: const InputDecoration(
        labelText: "اسم العميل",
        border: OutlineInputBorder(),
      ),
    );
  }
}
