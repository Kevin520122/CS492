import 'dart:math';

class Answer {
  final Random random = Random();
  // ignore: non_constant_identifier_names
  static List<String> possible_answers = [
    'Hi, I am Kevin',
    'I am not sure',
    'See you next time',
    'What\'s up!',
    'Go Beavs!',
    'Coding is fun!',
    'I love programming',
    'Python is the best!'
  ];
  int currentIndex = 0;
  String _ans = '###';

  String get ans => _ans;

  void roll() {
    currentIndex = random.nextInt(possible_answers.length);
    _ans = possible_answers[currentIndex];
  }
}
