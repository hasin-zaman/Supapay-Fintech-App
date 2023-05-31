import 'package:flutter/material.dart';

class ViewSubHeading extends StatelessWidget {
  const ViewSubHeading({Key? key, required this.heading}) : super(key: key);

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(
      (heading),
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black54
      ),

    );
  }
}
