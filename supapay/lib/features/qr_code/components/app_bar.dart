import 'package:flutter/material.dart';

AppBar appBar(Color? color) {
    return AppBar(
        bottom: TabBar(
            labelColor: color,
            tabs: const [Text('My Code'), Text('Scan Code')]),
        centerTitle: true,
        title: const Text("QR-Code"),
      );
  }