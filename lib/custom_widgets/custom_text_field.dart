import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final Icon icon;
  final TextEditingController controller;
  const CustomTextField({super.key, required this.label, required this.icon, required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        labelText: widget.label,
        suffixIcon: widget.icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6)
        )
      ),
    );
  }
}