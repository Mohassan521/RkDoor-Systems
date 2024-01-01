import 'package:flutter/material.dart';

class DateButton extends StatefulWidget {
  final IconData? icon;
  final Color? color;
  final Function()? onTap;

  DateButton({super.key, required this.onTap, this.color, this.icon});

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.40,
          height: MediaQuery.of(context).size.height * 0.055,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: widget.color),
          child: Icon(widget.icon)),
    );
  }
}
