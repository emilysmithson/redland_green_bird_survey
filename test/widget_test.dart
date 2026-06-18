import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redland_green_bird_survey/settings.dart';

void main() {
  test('defaultBoxDecoration applies the provided color', () {
    final BoxDecoration decoration = defaultBoxDecoration(color: Colors.red);

    expect(decoration.color, Colors.red);
    expect(
      decoration.borderRadius,
      const BorderRadius.all(Radius.circular(20.0)),
    );
  });
}
