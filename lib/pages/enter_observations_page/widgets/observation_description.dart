import 'package:flutter/material.dart';

Widget observationDescription({
  Function? onSelected,
  int? sightingType,
  required List sightingTypeList,
}) {
  return Column(
    children: sightingTypeList.map((sightingType) {
      return GestureDetector(
        onTap: () {
          onSelected!(sightingType.id);
        },
        child: Container(
          constraints: const BoxConstraints(minHeight: 50),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: const BorderRadius.all(Radius.circular(20)),

            border: Border.all(
              width: sightingType == sightingType.id ? 2.0 : 0.0,
              color: Colors.blueAccent,
            ),
          ),
          child: Center(
            child: Text(sightingType.description, textAlign: TextAlign.center),
          ),
        ),
      );
    }).toList(),
  );
}
