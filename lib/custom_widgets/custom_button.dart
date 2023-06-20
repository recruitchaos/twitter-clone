import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  const CustomButton({super.key, required this.label, required this.backgroundColor, required this.textColor});
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.backgroundColor,
        border: Border.all(
          width: 1
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(widget.label, style: Theme.of(context).textTheme.displaySmall?.apply(color: widget.textColor), textAlign: TextAlign.center,),
      ),
    );
  }
}