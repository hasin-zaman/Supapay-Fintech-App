import "package:flutter/material.dart";

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.textInputType, required this.labelText, required this.hintText, this.icon, required this.obscureText, required this.controller}) : super(key: key);

  final TextInputType textInputType;
  final String labelText;
  final String hintText;
  final Icon? icon;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        cursorColor: Color(0xFF1C6758),
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFCFCFCF),
            suffixIcon: icon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Color(0xFF1C6758)
              )
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  width: 5.0,
                  color: Colors.black45
              )
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: TextStyle(
              color: Colors.black54
            ),
            alignLabelWithHint: true
        ),
      ),
    );
  }
}