import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../my_details_controller.dart';

class RegisterContent extends StatefulWidget {
  final MyDetailsController controller;
  const RegisterContent({super.key, required this.controller});

  @override
  _RegisterContentState createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  bool checkBoxValue = true;
  TextEditingController emailController = TextEditingController();
  bool _emailErrorMsg = false;
  TextEditingController passwordController = TextEditingController();
  bool _passwordErrorMsg = false;
  TextEditingController nickNameController = TextEditingController();
  bool _nickNameErrorMsg = false;
  int _currentStep = 0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    // Example code for registration.
    Future<void> register() async {
      final FirebaseAuth auth = FirebaseAuth.instance;
      User? user;

      try {
        user = (await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )).user;
      } on FirebaseAuthException catch (error) {
        if (kDebugMode) {
          print(error.toString());
        }
        if (error.toString() ==
            '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
          if (!context.mounted) {
            return;
          }
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Oh dear'),
                content: Text(
                  "The email address ${emailController.value.text} has already been registered. Please log in.",
                ),
                actions: [
                  FilledButton(
                    onPressed: () {
                      widget.controller.content.value = MyDetailsView.login;
                      Navigator.pop(context);
                    },
                    child: const Text('Continue'),
                  ),
                ],
              );
            },
          );
        } else {
          if (kDebugMode) {
            print(error.toString());
          }
        }
        return;
      }

      if (user != null) {
        final createdUser = user;
        createdUser.updateDisplayName(nickNameController.value.text);
        if (!context.mounted) {
          return;
        }

        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Thank you, ${nickNameController.value.text}, for registering to use this app",
              ),
              content: const Text(
                "You have been sent an email with a verification link. Please click that link to continue.",
              ),
              actions: [
                FilledButton(
                  onPressed: () {
                    createdUser.sendEmailVerification();
                    widget.controller.content.value =
                        MyDetailsView.awaitingVerification;
                    Navigator.pop(context);
                  },
                  child: const Text('Continue'),
                ),
              ],
            );
          },
        );
      } else {
        return;
      }
    }

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'You need to register in order to use this app. We will never share '
            'your details with third parties.',
          ),
        ),
        Stepper(
          currentStep: _currentStep,
          onStepContinue: () async {
            switch (_currentStep) {
              case 0:
                final String email = emailController.value.text;
                if (RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(email)) {
                  setState(() {
                    _emailErrorMsg = false;
                    _currentStep++;
                  });
                } else {
                  setState(() {
                    _emailErrorMsg = true;
                  });
                }
                break;
              case 1:
                if (passwordController.value.text.length > 5) {
                  setState(() {
                    _passwordErrorMsg = false;
                    _currentStep++;
                  });
                } else {
                  setState(() {
                    _passwordErrorMsg = true;
                  });
                }
                break;
              case 2:
                if (nickNameController.value.text.length > 2) {
                  setState(() {
                    _nickNameErrorMsg = false;
                  });
                  setState(() {
                    isLoading = true;
                  });
                  await register();
                } else {
                  setState(() {
                    _nickNameErrorMsg = true;
                  });
                }
                break;
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _passwordErrorMsg = false;
                _emailErrorMsg = false;
                _nickNameErrorMsg = false;
                _currentStep--;
              });
            }
          },
          steps: [
            Step(
              title: const Text('Please enter your email address'),
              subtitle: _emailErrorMsg
                  ? const Text(
                      'Please enter a valid e-mail address',
                      style: TextStyle(color: Colors.red),
                    )
                  : const Text(''),
              content: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration.collapsed(
                      fillColor: Colors.white,
                      hintText: 'e.g. john_smith@mail.com',
                    ),
                  ),
                ),
              ),
            ),
            Step(
              title: const Text('Please choose a memorable password'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('At least 6 characters'),
                  _passwordErrorMsg
                      ? const Text(
                          'Please enter a valid password',
                          style: TextStyle(color: Colors.red),
                        )
                      : const Text(''),
                ],
              ),
              content: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration.collapsed(
                      hintText: '',
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Step(
              title: const Text(
                'Please choose a nickname (this will be visible to the public)',
              ),
              subtitle: _nickNameErrorMsg
                  ? const Text(
                      'Please choose a nickname with at least 3 characters.',
                      style: TextStyle(color: Colors.red),
                    )
                  : const Text(''),
              content: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nickNameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration.collapsed(
                      fillColor: Colors.white,
                      hintText: 'e.g. Johnny S',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
