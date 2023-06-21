import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final Icon? icon;
  final TextEditingController controller;
  final bool isObscure;
  const CustomTextField({super.key, required this.label,this.icon, required this.controller,required this.isObscure});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText:widget.isObscure,
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