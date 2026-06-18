import 'package:flutter/material.dart';

import '../../my_details_page/my_details_page.dart';

void needToRegister(BuildContext context) async {
  showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("You are not logged in"),
        actions: <Widget>[
          TextButton(
            child: const Text('Take me to login page'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyDetailsPage()),
              );
            },
          ),
        ],
        content: const Text(
          'In order to enter an observation you must first login',
        ),
      );
    },
  );
}
