import "package:flutter/material.dart";

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, this.validator, required this.textInputType, required this.labelText, required this.hintText, this.icon, required this.obscureText, required this.controller}) : super(key: key);

  final TextInputType textInputType;
  final String labelText;
  final String hintText;
  final Icon? icon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.obscureText,
        keyboardType: widget.textInputType,
        cursorColor: Color(0xFF1C6758),
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFCFCFCF),
            suffixIcon: widget.icon,
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
            labelText: widget.labelText,
            hintText: widget.hintText,
            labelStyle: TextStyle(
              color: Colors.black54
            ),
            alignLabelWithHint: true
        ),
      ),
    );
  }
}