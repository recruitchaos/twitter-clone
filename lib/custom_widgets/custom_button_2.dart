import 'package:flutter/material.dart';

class CustomButton2 extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  final String label;
  const CustomButton2({super.key, required this.backgroundColor, required this.textColor, required this.label});

  @override
  State<CustomButton2> createState() => _CustomButton2State();
}

class _CustomButton2State extends State<CustomButton2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.backgroundColor,
        border: Border.all(
          width: 1
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(widget.label, style: Theme.of(context).textTheme.displaySmall?.apply(color: widget.textColor), textAlign: TextAlign.center,),
      ),
    );
  }
}