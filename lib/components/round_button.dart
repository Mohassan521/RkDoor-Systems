import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  Color? color;
  Function()? onTap;
  String text;
  RoundButton({super.key, required this.text, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.40,
        height: MediaQuery.of(context).size.height * 0.055,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(6), color: color),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
