import 'package:flutter/material.dart';

import '../../models/quiz_questions.dart';
import '../../widgets/page_template.dart';
import 'widgets/quiz_flipcard_widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int quizQuestion = -1;
  int score = 0;
  bool firstGuess = true;
  bool showNextButton = false;
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Quiz',
      image: 'assets/songthrush.png',
      heroTag: 'quiz',
      widgetList: quizQuestion == -1
          ? introduction()
          : quizQuestion == 20
          ? result()
          : body(QuizQuestion.quizQuestions[quizQuestion]),
    );
  }

  void onTap(bool correct) {
    if (firstGuess) {
      if (correct) {
        score++;
      }
      setState(() {
        showNextButton = true;
      });
      firstGuess = false;
    }
  }

  List<Widget> body(QuizQuestion question) {
    return [
      const SizedBox(height: 8),
      Center(
        child: Text(
          'Question ${quizQuestion + 1} of 20',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 60,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              question.question,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: question.images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            return QuizFlipCardWidget(
              image: 'assets/${question.images[index]}',
              correct: index == question.correctAnswer,
              answer: question.answers[index],
              onTap: onTap,
            );
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Score: $score',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            showNextButton
                ? ElevatedButton(
                    child: const Text('Next'),
                    onPressed: () {
                      setState(() {
                        quizQuestion++;

                        firstGuess = true;

                        showNextButton = false;
                      });
                    },
                  )
                : Container(),
          ],
        ),
      ),
    ];
  }

  List<Widget> introduction() {
    return [
      const SizedBox(height: 16),
      const Center(
        child: Text(
          'Can you identify these 20 birds? ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      const SizedBox(height: 16),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Try these 20 multiple-choice questions testing you on your bird knowledge.',
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('assets/owl.png')),
          ),
          height: 250,
          width: 250,
        ),
      ),
      Center(
        child: ElevatedButton(
          child: const Text('Start'),
          onPressed: () {
            setState(() {
              score = 0;
              quizQuestion++;
              firstGuess = true;
              showNextButton = false;
            });
          },
        ),
      ),
    ];
  }

  List<Widget> result() {
    late String asset;
    if (score < 8) {
      asset = 'assets/pigeon.png';
    } else if (score < 16) {
      asset = 'assets/robin1.png';
    } else if (score < 20) {
      asset = 'assets/kestrel_1.png';
    } else {
      asset = 'assets/owl.png';
    }

    return [
      SizedBox(
        height: 40,
        child: Center(
          child: Text(
            'You scored $score out of 20!',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(asset)),
          ),
          height: 250,
          width: 250,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              child: const Text('Home'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text('Try again'),
              onPressed: () {
                setState(() {
                  quizQuestion = -1;
                  firstGuess = true;
                });
              },
            ),
          ],
        ),
      ),
    ];
  }
}
