import 'package:flutter/material.dart';

import '../my_details_controller.dart';

class UnauthenticatedContent extends StatefulWidget {
  final MyDetailsController controller;
  const UnauthenticatedContent({super.key, required this.controller});

  @override
  _UnauthenticatedContentState createState() => _UnauthenticatedContentState();
}

class _UnauthenticatedContentState extends State<UnauthenticatedContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '\n\nIn order to submit any observations to this app you will need to register or log in if you have previously registered. \n',
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('assets/robin1.png')),
          ),
          height: 200,
          width: 200,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                widget.controller.content.value = MyDetailsView.login;
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                widget.controller.content.value = MyDetailsView.register;
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ],
    );
  }
}
