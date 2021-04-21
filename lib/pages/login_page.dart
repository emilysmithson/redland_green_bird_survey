import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String errorMsg = '';

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter your email address'),
            const SizedBox(height: 8),
            Text(
              errorMsg,
              style: const TextStyle(color: Colors.red),
            ),
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
                  )
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
                    hintText: 'eg john_smith@mail.com',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Enter your password'),
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
                  )
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
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                errorMsg = '';
              });

              final FirebaseAuth _auth = FirebaseAuth.instance;
              _auth
                  .sendPasswordResetEmail(email: emailController.value.text)
                  .catchError((error) {
                if (error.toString() ==
                    '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
                  setState(() {
                    errorMsg =
                        'There is no record of this email address. The user may have been deleted. Please re-register.';
                    return;
                  });
                } else if (error.toString().isNotEmpty) {
                  setState(() {
                    errorMsg = 'Please enter a valid email address';
                    return;
                  });
                }
                if (error.toString().isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                            "Please check your email for a password reset message"),
                        content: const Text(
                            "Once you have reset your password you should be able to log in here."),
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
                }
              });
            },
            child: const Text('Forgotten Password'),
          ),
          ElevatedButton(
            onPressed: () async {
              final FirebaseAuth _auth = FirebaseAuth.instance;

              final UserCredential _user =
                  await _auth.signInWithEmailAndPassword(
                      email: emailController.value.text,
                      password: passwordController.value.text);
              print(_user.user.displayName);
              if (_user != null) {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(),
                  ),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      )
    ];
    return PageTemplate(
      title: 'Login Page',
      image: 'assets/robin1.png',
      widgetList: widgetList,
      heroTag: 'robin',
    );
  }
}