import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  final Icon? icon;
  final Color? color;
  final double? width;
  final double? height;
  final Function()? onTap;
  final String? text;

  RoundButton(
      {super.key,
      this.height,
      this.width,
      this.text,
      required this.onTap,
      this.color,
      this.icon});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.40,
        height: widget.height ?? MediaQuery.of(context).size.height * 0.055,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: widget.color),
        child: Center(
            child: Text(
          widget.text ?? "",
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
