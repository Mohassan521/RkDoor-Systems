import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:provider/provider.dart';

class ReusableDropdown extends StatelessWidget {
  final List<String> items;
  final SelectedValueProvider valueProvider;
  final Function(String?)? onChanged;

  ReusableDropdown({
    required this.items,
    required this.valueProvider,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selectedValueProvider =
        Provider.of<SelectedValueProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey, width: 1)),
      child: DropdownButton<String>(
        style: TextStyle(fontSize: 10, color: Colors.black),
        underline: const SizedBox(),
        isExpanded: true,
        value: valueProvider.selectedValue == ""
            ? items.first
            : valueProvider.selectedValue,
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
