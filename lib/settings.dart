import 'package:flutter/material.dart';

BoxDecoration defaultBoxDecoration({Color? color}) {
  return BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
    color: color,
    boxShadow: const [
      BoxShadow(color: Colors.grey, offset: Offset(5.0, 5.0), blurRadius: 5.0),
    ],
  );
}
