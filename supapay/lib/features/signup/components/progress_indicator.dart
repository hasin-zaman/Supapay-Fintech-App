import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: LinearProgressIndicator(
        value: value,
        minHeight: 4,
        backgroundColor: Color(0xFFCFCFCF),
        color: const Color(0xFF1C6758),
      ),
    );
  }
}
