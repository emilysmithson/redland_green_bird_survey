import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/my_details_page/my_details_controller.dart';

import '../../../settings.dart';

class AwaitingVerificationContent extends StatefulWidget {
  final MyDetailsController controller;
  const AwaitingVerificationContent({super.key, required this.controller});

  @override
  _AwaitingVerificationContentState createState() =>
      _AwaitingVerificationContentState();
}

class _AwaitingVerificationContentState
    extends State<AwaitingVerificationContent> {
  User? user = FirebaseAuth.instance.currentUser;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _checkEmailVerified();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: defaultBoxDecoration(color: Colors.green[50]),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We have sent an email with a verification link to'
                '\n\n${user!.email}'
                '\n\nPlease tap the link to verify your email address.',
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: CircularProgressIndicator(strokeWidth: 6),
              ),
              FilledButton(
                onPressed: () {
                  widget.controller.content.value =
                      MyDetailsView.unauthenticated;
                },
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _checkEmailVerified() async {
    user = FirebaseAuth.instance.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      timer.cancel();
      widget.controller.content.value = MyDetailsView.authenticated;
    }
  }
}
