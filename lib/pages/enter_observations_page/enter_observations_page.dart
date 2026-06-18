import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/sighting.dart';
import '../home_page/home_page.dart';
import 'widgets/comments.dart';
import 'widgets/need_to_register.dart';
import 'widgets/select_bird.dart';
import 'widgets/select_bird_box_no.dart';
import 'widgets/show_instructions.dart';
import 'widgets/step.dart';
import 'widgets/time_of_observation.dart';

class EnterObservationsPage extends StatefulWidget {
  final int? birdBox;
  final Sighting? sighting;

  const EnterObservationsPage({super.key, this.birdBox, this.sighting});
  @override
  _EnterObservationsPageState createState() => _EnterObservationsPageState();
}

class _EnterObservationsPageState extends State<EnterObservationsPage> {
  int? _birdBox = -1;
  int _bird = -1;
  DateTime _dateTime = DateTime.now();
  late bool showModal;
  String? _comment;
  int currentPage = 0;

  Future checkShowModal() async {
    final prefs = await SharedPreferences.getInstance();
    showModal = prefs.getBool('showModal') ?? true;
  }

  @override
  void initState() {
    initialise();
    super.initState();
  }

  Future initialise() async {
    if (FirebaseAuth.instance.currentUser == null ||
        !FirebaseAuth.instance.currentUser!.emailVerified) {
      return WidgetsBinding.instance.addPostFrameCallback(
        (_) => needToRegister(context),
      );
    }
    await checkShowModal();
    if (widget.birdBox != null) {
      setState(() {
        _birdBox = widget.birdBox;
      });
    }
    if (showModal) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showInstructions(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SizedBox(
          height: 35,
          child: FloatingActionButton(
            backgroundColor: Colors.green[100],
            child: const Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {
              showModal = true;
              showInstructions(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      body: Column(
        children: [
          Hero(
            tag: 'greattit',
            child: Material(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/greattit2.png'),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: FittedBox(
                        child: Text(
                          'Enter Observations',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: CustomStepper(
              customStepList: [
                CustomStep(
                  stepNumber: 1,
                  title: 'Select the bird box number',
                  content: SelectBirdBoxNo(
                    birdBox: _birdBox,
                    context: context,
                    onSelect: (int birdBox) {
                      setState(() {
                        _birdBox = birdBox;
                      });
                    },
                  ),
                  proceed: _birdBox != -1,
                  onNext: () {
                    if (_birdBox == -1) {
                      return;
                    }
                  },
                  isLast: false,
                  isFirst: true,
                  errorMsg: 'Please select a box.',
                ),
                CustomStep(
                  stepNumber: 2,
                  title: 'Time of Observation',
                  content: TimeOfObservation(
                    dateTime: _dateTime,
                    onSelected: (DateTime dateTime) {
                      _dateTime = dateTime;
                    },
                    maxDate: DateTime.now(),
                  ),
                  onNext: () {},
                  isLast: false,
                  isFirst: false,
                  proceed: true,
                ),
                CustomStep(
                  stepNumber: 3,
                  title: 'Please select which bird you saw',
                  content: selectBird(_bird, (int bird) {
                    setState(() {
                      _bird = bird;
                    });
                  }),
                  onNext: () {},
                  errorMsg: 'Please select one.',
                  isLast: false,
                  isFirst: false,
                  proceed: _bird != -1,
                ),
                CustomStep(
                  stepNumber: 4,
                  title:
                      'Thank you for your submission. If you have any comments please enter them here.',
                  content: SizedBox(
                    height: 300,
                    child: comments(
                      onChanged: (String comment) {
                        _comment = comment;
                      },
                    ),
                  ),
                  onNext: () {
                    final Sighting sighting = Sighting(
                      dateTime: _dateTime,
                      birdBox: _birdBox,
                      userEmail: FirebaseAuth.instance.currentUser!.email,
                      user: FirebaseAuth.instance.currentUser!.displayName,
                      bird: _bird,
                      comment: _comment,
                    );
                    if (widget.sighting != null) {
                      Sighting.updateSighting(sighting, widget.sighting!.id!);
                    } else {
                      Sighting.addSighting(sighting);
                    }

                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Thank you for entering an observation.",
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Enter another observation'),
                              onPressed: () {
                                setState(() {
                                  _birdBox = -1;
                                  _bird = -1;
                                  _dateTime = DateTime.now();
                                  _comment = '';
                                });

                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const EnterObservationsPage(),
                                  ),
                                );
                              },
                            ),
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomePage(),
                                ),
                                (Route<dynamic> route) => false,
                              ),
                            ),
                          ],
                          content: const Text(
                            'Your observations will help us better understand how the bird boxes are used.',
                          ),
                        );
                      },
                    );
                  },
                  proceed: true,
                  isLast: true,
                  isFirst: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
