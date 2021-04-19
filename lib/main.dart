import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redland Green Bird Survey',
      home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong!');
            } else if (snapshot.hasData) {
              return HomePage();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
