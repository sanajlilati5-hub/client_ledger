import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  final bool obscure;
  final bool error;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    this.obscure = false,
    this.error = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xff073c69),
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Color(0xFFFFFEFE),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: error ? Colors.red : Colors.white,
              width: 1.4,
            ),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
        if (error)
          Padding(
            padding: EdgeInsets.only(top: 5, right: 5),
            child: Text(
              "حقل مطلوب",
              style: TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
      ],
    );
  }
}
