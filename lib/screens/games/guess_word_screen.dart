import 'package:flutter/material.dart';
import 'dart:math';

class GuessTheWordScreen extends StatefulWidget {
  const GuessTheWordScreen({Key? key}) : super(key: key);

  @override
  _GuessTheWordScreenState createState() => _GuessTheWordScreenState();
}

class _GuessTheWordScreenState extends State<GuessTheWordScreen> {
  final List<WordImageModel> _words = _createWordImagePairs();
  int _currentWordIndex = 0;
  String _inputWord = '';
  List<String> _displayedWord = [];
  List<String> _shuffledCharacters = [];

  @override
  void initState() {
    super.initState();
    _setupNextWord();
  }

  void _setupNextWord() {
    setState(() {
      _inputWord = '';
      _displayedWord =
          List.generate(_words[_currentWordIndex].word.length, (_) => '_');
      _shuffledCharacters =
          _generateCharacterPool(_words[_currentWordIndex].word)
            ..shuffle(Random());
    });
  }

  List<String> _generateCharacterPool(String word) {
    final random = Random();
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final wordChars = word.split('');
    final randomChars = List.generate(
      word.length,
      (_) => letters[random.nextInt(letters.length)],
    );
    return wordChars + randomChars;
  }

  void _onCharacterInput(String character) {
    setState(() {
      if (_inputWord.length < _words[_currentWordIndex].word.length) {
        _inputWord += character;
        _displayedWord[_inputWord.length - 1] = character;
      }
      if (_inputWord == _words[_currentWordIndex].word) {
        if (_currentWordIndex < _words.length - 1) {
          _currentWordIndex++;
          _setupNextWord();
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
                _currentWordIndex = 0;
                _setupNextWord();
              });
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }

  void _onRestartWord() {
    setState(() {
      _inputWord = '';
      _displayedWord =
          List.generate(_words[_currentWordIndex].word.length, (_) => '_');
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
          'Guess The Word',
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
                          'Word ${_currentWordIndex + 1} of ${_words.length}',
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
                              IconButton(
                                iconSize: 100,
                                icon: Icon(_words[_currentWordIndex].icon),
                                onPressed: () {},
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _displayedWord
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
                            crossAxisCount: 7,
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
                          onPressed: _onRestartWord,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Restart Word',
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

class WordImageModel {
  final String word;
  final IconData icon;

  WordImageModel({required this.word, required this.icon});
}

List<WordImageModel> _createWordImagePairs() {
  return [
    WordImageModel(word: 'APPLE', icon: Icons.apple),
    WordImageModel(word: 'HOUSE', icon: Icons.house),
    WordImageModel(word: 'CAR', icon: Icons.directions_car),
    WordImageModel(word: 'STAR', icon: Icons.star),
    WordImageModel(word: 'WATER', icon: Icons.water),
  ];
}
