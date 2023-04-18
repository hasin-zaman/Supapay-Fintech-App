import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.buttonText, this.textColor, required this.buttonColor, this.onTap}) : super(key: key);

  final String buttonText;
  final Color? textColor;
  final Color buttonColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(100, 12, 100, 12),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
