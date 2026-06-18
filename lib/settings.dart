import 'package:flutter/material.dart';

Color appBackgroundColor = Colors.green[100]!;

BoxDecoration defaultBoxDecoration({Color? color}) {
  return BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
    color: color,
  );
}
