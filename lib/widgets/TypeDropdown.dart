import 'package:flutter/material.dart';

class TypeDropdown extends StatelessWidget {
  final String selected;
  final Function(String) onChanged;

  const TypeDropdown({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        labelText: "النوع",
        border: OutlineInputBorder(),
      ),
      value: selected,
      items: const [
        DropdownMenuItem(value: "لنا", child: Text("لنا (دائن)")),
        DropdownMenuItem(value: "علينا", child: Text("علينا (مدين)")),
      ],
      onChanged: (value) => onChanged(value.toString()),
    );
  }
}
