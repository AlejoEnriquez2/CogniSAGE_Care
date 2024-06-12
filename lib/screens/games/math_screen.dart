import 'package:flutter/material.dart';
import 'dart:math';

class MathExerciseScreen extends StatefulWidget {
  const MathExerciseScreen({Key? key}) : super(key: key);

  @override
  _MathExerciseScreenState createState() => _MathExerciseScreenState();
}

class _MathExerciseScreenState extends State<MathExerciseScreen> {
  final List<MathProblemModel> _problems = _createMathProblems();
  int _currentProblemIndex = 0;
  String _inputAnswer = '';
  List<String> _displayedAnswer = [];
  List<String> _shuffledCharacters = [];

  @override
  void initState() {
    super.initState();
    _setupNextProblem();
  }

  void _setupNextProblem() {
    setState(() {
      _inputAnswer = '';
      _displayedAnswer = List.generate(
          _problems[_currentProblemIndex].answer.length, (_) => '_');
      _shuffledCharacters =
          _generateCharacterPool(_problems[_currentProblemIndex].answer)
            ..shuffle(Random());
    });
  }

  List<String> _generateCharacterPool(String answer) {
    final random = Random();
    const numbers = '0123456789';
    final answerChars = answer.split('');
    final poolSize = random.nextInt(6) + 4; // Between 6 and 15
    final randomChars = List.generate(
      poolSize - answerChars.length,
      (_) => numbers[random.nextInt(numbers.length)],
    );
    return answerChars + randomChars;
  }

  void _onCharacterInput(String character) {
    setState(() {
      if (_inputAnswer.length < _problems[_currentProblemIndex].answer.length) {
        _inputAnswer += character;
        _displayedAnswer[_inputAnswer.length - 1] = character;
      }
      if (_inputAnswer == _problems[_currentProblemIndex].answer) {
        if (_currentProblemIndex < _problems.length - 1) {
          _currentProblemIndex++;
          _setupNextProblem();
        } else {
          _showGameCompletedDialog();
        }
      }
    });
  }

  void _showGameCompletedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Congratulations!'),
        content: const Text('You have completed the game.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _currentProblemIndex = 0;
                _setupNextProblem();
              });
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }

  void _onRestartProblem() {
    setState(() {
      _inputAnswer = '';
      _displayedAnswer = List.generate(
          _problems[_currentProblemIndex].answer.length, (_) => '_');
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Math Exercises',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'all_games');
          },
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: CustomBoxDecorator(),
              child: SizedBox(
                height: deviceHeight * 0.87,
                width: deviceWidth * 0.95,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: deviceHeight * 0.02,
                        horizontal: deviceWidth * 0.025),
                    child: Column(
                      children: [
                        Text(
                          'Problem ${_currentProblemIndex + 1} of ${_problems.length}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceHeight * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: deviceHeight * 0.05),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth * 0.005,
                              vertical: deviceHeight * 0.025),
                          width: deviceWidth * 0.60,
                          height: deviceHeight * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                _problems[_currentProblemIndex].problem,
                                style: TextStyle(
                                    fontSize: deviceHeight * 0.05,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _displayedAnswer
                                    .map((char) => Text(
                                          char,
                                          style: TextStyle(
                                              fontSize: deviceHeight * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.02),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: _shuffledCharacters.length,
                          itemBuilder: (context, index) {
                            String char = _shuffledCharacters[index];
                            return ElevatedButton(
                              onPressed: () => _onCharacterInput(char),
                              child: Text(char),
                            );
                          },
                        ),
                        SizedBox(height: deviceHeight * 0.02),
                        ElevatedButton(
                          onPressed: _onRestartProblem,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Restart Problem',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: deviceHeight * 0.016,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: deviceHeight * 0.14,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: BottomAppBar(
                      height: deviceHeight * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: deviceHeight * 0.01,
                    left: deviceWidth * 0.424,
                    child: Container(
                      width: deviceWidth * 0.15,
                      height: deviceHeight * 0.11,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration CustomBoxDecorator() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 29, 80, 143),
          Color.fromARGB(255, 37, 102, 183),
        ],
      ),
    );
  }
}

class MathProblemModel {
  final String problem;
  final String answer;

  MathProblemModel({required this.problem, required this.answer});
}

List<MathProblemModel> _createMathProblems() {
  return [
    MathProblemModel(problem: '5 + 3', answer: '8'),
    MathProblemModel(problem: '10 - 2', answer: '8'),
    MathProblemModel(problem: '7 x 3', answer: '21'),
    MathProblemModel(problem: '15 / 3', answer: '5'),
    MathProblemModel(problem: '9 + 6', answer: '15'),
  ];
}
