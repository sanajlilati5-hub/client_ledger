import 'package:flutter/material.dart';

class CurrencyDropdown extends StatelessWidget {
  final String selected;
  final Function(String) onChanged;

  const CurrencyDropdown({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        labelText: "العملة",
        border: OutlineInputBorder(),
      ),
      value: selected,
      items: const [
        DropdownMenuItem(value: "SYP", child: Text("SYP")),
        DropdownMenuItem(value: "USD", child: Text("USD")),
        DropdownMenuItem(value: "EUR", child: Text("EUR")),
      ],
      onChanged: (value) => onChanged(value.toString()),
    );
  }
}
