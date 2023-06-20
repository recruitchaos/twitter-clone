import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});
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
        color: const Color(0xff1C9BEF),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text("Continue", style: Theme.of(context).textTheme.displaySmall?.apply(color: Colors.white), textAlign: TextAlign.center,),
      ),
    );
  }
}