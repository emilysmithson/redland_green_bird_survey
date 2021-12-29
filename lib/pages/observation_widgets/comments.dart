import 'package:flutter/material.dart';

Widget Comments({Function? onChanged, String? comment}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Text('Please note your comment will not be visible to the public.'),
        SizedBox(
          height: 200,
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(5.0, 5.0),
                  blurRadius: 5.0,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Enter your comments here (optional).",
                ),
                keyboardType: TextInputType.multiline,
                initialValue: comment,
                onChanged: (value) {
                  onChanged!(value);
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
