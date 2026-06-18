class QuizQuestion {
  final String question;
  final List<String> images;
  List<String> answers;

  final int correctAnswer;

  QuizQuestion({
    required this.question,
    required this.images,
    required this.correctAnswer,
    required this.answers,
  });

  static final question0 = QuizQuestion(
    question: "Which of these birds is a Robin?",
    images: ['sparrow_2.png', 'robin1.png', 'dunnock1.png', 'jay1.png'],
    answers: ['Sparrow', 'Robin', 'Dunnock', 'Jay'],
    correctAnswer: 1,
  );
  static final question1 = QuizQuestion(
    question: "Which of these birds is a Dunnock?",
    images: ['bluetit1.png', 'crow1.png', 'dunnock2.png', 'goldfinch1.png'],
    correctAnswer: 2,
    answers: ['Blue tit', 'Crow', 'Dunock', 'Goldfinch'],
  );
  static final question2 = QuizQuestion(
    question: "Which of these birds is a Jackdaw?",
    images: ['jackdaw1.png', 'kestrel.png', 'crow2.png', 'robin.png'],
    answers: ['Jackdaw', 'Kestrel', 'Crow', 'Robin'],
    correctAnswer: 0,
  );
  static final question3 = QuizQuestion(
    question: "Which of these birds is a Great tit?",
    images: ['jay1.png', 'longtailedtit.png', 'greattit2.png', 'bluetit3.png'],
    answers: ['Jay', 'Long tailed tit', 'Great tit', 'Blue tit'],
    correctAnswer: 2,
  );
  static final question4 = QuizQuestion(
    question: "Which of these birds is a Nuthatch?",
    images: [
      'nuthatch3.png',
      'goldfinch2.png',
      'longtailedtit3.png',
      'kestrel_1.png',
    ],
    answers: ['Nuthatch', 'Goldfinch', 'Long tailed tit', 'Kestrel'],
    correctAnswer: 0,
  );
  static final question5 = QuizQuestion(
    question: "Which of these birds is a Long Tailed Tit?",
    images: ['crow1.png', 'pigeon.png', 'songthrush.png', 'longtailedtit.png'],
    answers: ['Crow', 'Pigeon', 'Songthrush', 'Long tailed tit'],
    correctAnswer: 3,
  );
  static final question6 = QuizQuestion(
    question: "Which of these birds is a Wren?",
    images: ['wren3.png', 'wagtail1.png', 'robin1.png', 'pigeon.png'],
    answers: ['Wren', 'Wagtail', 'Robin', 'Pigeon'],
    correctAnswer: 0,
  );
  static final question7 = QuizQuestion(
    question: "Which of these birds is a Pigeon?",
    images: [
      'pied_flycatcher.png',
      'pigeon.png',
      'starling.png',
      'kestrel_1.png',
    ],
    answers: ['Pied Flycatcher', 'Pigeon', 'Starling', 'Kestrel'],
    correctAnswer: 1,
  );
  static final question8 = QuizQuestion(
    question: "Which of these birds is a Starling?",
    images: ['sparrow_2.png', 'starling.png', 'woodpecker.png', 'magpie.png'],
    answers: ['Sparrow', 'Starling', 'Woodpecker', 'Magpie'],
    correctAnswer: 1,
  );
  static final question9 = QuizQuestion(
    question: "Which of these birds is a Magpie?",
    images: [
      'sparrowhawk_1.png',
      'sparrow_1.png',
      'bluetit4.png',
      'magpie3.png',
    ],
    answers: ['SparrowHawk', 'Sparrow', 'Blue tit', 'Magpie'],
    correctAnswer: 3,
  );
  static final question10 = QuizQuestion(
    question: "Which of these birds is a Blackbird?",
    images: ['jackdaw1.png', 'blackbird1.png', 'crow1.png', 'greattit2.png'],
    answers: ['Jackdaw', 'Blackbird', 'Crow', 'Great tit'],
    correctAnswer: 1,
  );
  static final question11 = QuizQuestion(
    question: "Which of these birds is a Jay?",
    images: ['jay1.png', 'kestrel.png', 'longtailedtit2.png', 'goldfinch4.png'],
    answers: ['Jay', 'Kestrel', 'Long tailed tit', 'Goldfinch'],
    correctAnswer: 0,
  );
  static final question12 = QuizQuestion(
    question: "Which of these birds is a Coal tit?",
    images: ['kestrel_1.png', 'jay1.png', 'crow3.png', 'coaltit1.png'],
    answers: ['Kestrel', 'Jay', 'Crow', 'Coaltit'],
    correctAnswer: 3,
  );
  static final question13 = QuizQuestion(
    question: "Which of these birds is a Goldfinch?",
    images: ['starling.png', 'crow1.png', 'goldfinch1.png', 'owl.png'],
    answers: ['Starling', 'Crow', 'Goldfinch', 'Owl'],
    correctAnswer: 2,
  );
  static final question14 = QuizQuestion(
    question: "Which of these birds is a Sparrowhawk?",
    images: [
      'sparrow_2.png',
      'sparrowhawk_1.png',
      'bluetit4.png',
      'magpie3.png',
    ],
    answers: ['Sparrow', 'Sparrowhawk', 'Blue tit', 'Magpie'],
    correctAnswer: 1,
  );
  static final question15 = QuizQuestion(
    question: "Which of these birds is a Song Thrush?",
    images: ['robin1.png', 'wagtail.png', 'songthrush.png', 'wren3.png'],
    answers: ['Robin', 'Wagtail', 'Songthrush', 'Wren'],
    correctAnswer: 2,
  );
  static final question16 = QuizQuestion(
    question: "Which of these birds is a Kestrel?",
    images: ['kestrel.png', 'owl.png', 'magpie1.png', 'sparrowhawk_1.png'],
    answers: ['Kestrel', 'Owl', 'Magpie', 'Sparrowhawk'],
    correctAnswer: 0,
  );
  static final question17 = QuizQuestion(
    question: "Which of these birds is a Crow?",
    images: ['crow2.png', 'blackbird1.png', 'goldfinch4.png', 'jay1.png'],
    answers: ['Crow', 'Blackbird', 'Goldfinch', 'Jay'],
    correctAnswer: 0,
  );
  static final question18 = QuizQuestion(
    question: "Which of these birds is a Great Spotted Woodpecker?",
    images: ['starling.png', 'woodpecker.png', 'wren3.png', 'songthrush_2.png'],
    answers: ['Starling', 'Great Spotted Woodpecker', 'Wren', 'Songthrush'],
    correctAnswer: 1,
  );
  static final question19 = QuizQuestion(
    question: "Which of these birds is a House Sparrow?",
    images: ['sparrow_1.png', 'starling2.png', 'wagtail.png', 'wren2.png'],
    answers: ['House Sparrow', 'Starling', 'Wagtail', 'Wren'],
    correctAnswer: 0,
  );

  static List<QuizQuestion> quizQuestions = [
    question0,
    question1,
    question2,
    question3,
    question4,
    question5,
    question6,
    question7,
    question8,
    question9,
    question10,
    question11,
    question12,
    question13,
    question14,
    question15,
    question16,
    question17,
    question18,
    question19,
  ];
}
