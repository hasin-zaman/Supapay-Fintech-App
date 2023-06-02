import "package:flutter/material.dart";

class CustomButtonLarge extends StatelessWidget {
  const CustomButtonLarge(
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
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            alignment: Alignment.centerLeft,
            backgroundColor: buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
