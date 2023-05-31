import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonText,
      this.textColor,
      required this.buttonColor,
      this.onTap})
      : super(key: key);

  final String buttonText;
  final Color? textColor;
  final Color buttonColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
