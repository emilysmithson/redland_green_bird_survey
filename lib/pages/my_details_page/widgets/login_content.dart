import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../my_details_controller.dart';

class LoginContent extends StatefulWidget {
  final MyDetailsController controller;
  const LoginContent({super.key, required this.controller});

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String emailErrorMsg = '';
  String passwordErrorMsg = '';
  String? errorMsg = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Enter your email address'),
              const SizedBox(height: 8),
              Text(emailErrorMsg, style: const TextStyle(color: Colors.red)),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration.collapsed(
                      fillColor: Colors.white,
                      hintText: '',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Enter your password'),
              Text(passwordErrorMsg, style: const TextStyle(color: Colors.red)),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 5.0,
                    ),
                  ],
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
              Text(errorMsg!, style: const TextStyle(color: Colors.red)),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final String email = emailController.value.text;
                      if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(email)) {
                        setState(() {
                          isLoading = false;
                          emailErrorMsg = '';
                        });
                      } else {
                        setState(() {
                          isLoading = false;
                          emailErrorMsg = 'Please enter a valid e-mail address';
                        });
                        return;
                      }
                      if (passwordController.value.text.length < 6) {
                        setState(() {
                          isLoading = false;
                          passwordErrorMsg =
                              'Please enter your password (at least 6 characters)';
                        });
                        return;
                      } else {
                        passwordErrorMsg = '';
                      }

                      final FirebaseAuth auth = FirebaseAuth.instance;
                      try {
                        await auth.signInWithEmailAndPassword(
                          email: emailController.value.text,
                          password: passwordController.value.text,
                        );
                      } on FirebaseAuthException catch (error) {
                        if (!mounted) {
                          return;
                        }
                        setState(() {
                          isLoading = false;
                          errorMsg = error.message;
                        });
                        return;
                      }
                      if (!context.mounted) {
                        return;
                      }
                      widget.controller.content.value =
                          MyDetailsView.authenticated;
                    },
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Submit'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 200,
                  child: OutlinedButton(
                    onPressed: () async {
                      final BuildContext dialogContext = context;
                      FirebaseAuth.instance.signOut();
                      setState(() {
                        emailErrorMsg = '';
                      });

                      final FirebaseAuth auth = FirebaseAuth.instance;
                      try {
                        await auth.sendPasswordResetEmail(
                          email: emailController.value.text,
                        );
                      } on FirebaseAuthException catch (error) {
                        if (error.toString() ==
                            '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
                          setState(() {
                            emailErrorMsg =
                                'There is no record of this email address. The user may have been deleted. Please re-register.';
                            return;
                          });
                        } else if (error.toString().isNotEmpty) {
                          setState(() {
                            emailErrorMsg =
                                'Please enter a valid email address';
                            return;
                          });
                        }
                        return;
                      }
                      if (!dialogContext.mounted) {
                        return;
                      }
                      showDialog(
                        context: dialogContext,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              "Please check your email for a password reset message",
                            ),
                            content: const Text(
                              "Once you have reset your password you should be able to log in here."
                              "\n\nBe sure to check your junk mail.",
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Forgotten Password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
