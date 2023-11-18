import 'package:flutter/material.dart';

class ReusableDropdown extends StatelessWidget {
  final List<String> items;
  final String value;
  Function(String?)? onChanged;

  ReusableDropdown({
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey, width: 1)),
      child: DropdownButton<String>(
        style: TextStyle(fontSize: 10, color: Colors.black),
        underline: const SizedBox(),
        isExpanded: true,
        value: value,
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem(
            alignment: Alignment.center,
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
