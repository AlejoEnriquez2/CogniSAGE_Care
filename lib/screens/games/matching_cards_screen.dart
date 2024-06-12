import 'dart:math';
import 'package:flutter/material.dart';

class MatchingCardsScreen extends StatefulWidget {
  const MatchingCardsScreen({Key? key}) : super(key: key);

  @override
  _MatchingCardsScreenState createState() => _MatchingCardsScreenState();
}

class _MatchingCardsScreenState extends State<MatchingCardsScreen> {
  List<CardModel> cards = [];
  CardModel? _firstCard;
  CardModel? _secondCard;
  bool _waitForFlip = false;

  @override
  void initState() {
    super.initState();
    cards = _createCardPairs();
  }

  void _onCardFlip(CardModel card) {
    if (_waitForFlip || card.isFlipped || card.isCorrect) return;

    setState(() {
      card.isFlipped = true;

      if (_firstCard == null) {
        _firstCard = card;
      } else if (_secondCard == null) {
        _secondCard = card;
        _waitForFlip = true;

        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            if (_firstCard!.name == _secondCard!.name) {
              _firstCard!.isCorrect = true;
              _secondCard!.isCorrect = true;
            } else {
              _firstCard!.isFlipped = false;
              _secondCard!.isFlipped = false;
            }

            _firstCard = null;
            _secondCard = null;
            _waitForFlip = false;
          });
        });
      }
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
          'Matching Cards',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'matching_instructions');
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
                          'Correct: ${cards.where((card) => card.isCorrect).length}',
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
                          width: deviceWidth * 0.90,
                          height: deviceHeight * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(3, (rowIndex) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(4, (colIndex) {
                                  int cardIndex = rowIndex * 4 + colIndex;
                                  return CardCustom(
                                      card: cards[cardIndex],
                                      onFlip: _onCardFlip);
                                }),
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  cards = _createCardPairs();
                                  _firstCard = null;
                                  _secondCard = null;
                                  _waitForFlip = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Restart',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: deviceHeight * 0.016,
                                ),
                              ),
                            ),
                          ],
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

class CardCustom extends StatefulWidget {
  final CardModel card;
  final Function(CardModel) onFlip;

  const CardCustom({Key? key, required this.card, required this.onFlip})
      : super(key: key);

  @override
  _CardCustomState createState() => _CardCustomState();
}

class _CardCustomState extends State<CardCustom> {
  bool get _showFrontSide => widget.card.isFlipped || widget.card.isCorrect;

  void _flipCard() {
    widget.onFlip(widget.card);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final rotate = Tween(begin: pi, end: 0.0).animate(animation);
          return AnimatedBuilder(
              animation: rotate,
              child: child,
              builder: (context, child) {
                final isUnder = (ValueKey(_showFrontSide) != child?.key);
                final value =
                    isUnder ? min(rotate.value, pi / 2) : rotate.value;
                return Transform(
                  transform: Matrix4.rotationY(value),
                  alignment: Alignment.center,
                  child: child,
                );
              });
        },
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        child: _showFrontSide
            ? _buildBack(deviceWidth, deviceHeight, widget.card)
            : _buildFront(deviceWidth, deviceHeight),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
      ),
    );
  }

  Widget _buildFront(double width, double height) {
    return Container(
      key: const ValueKey(true),
      width: width * 0.2,
      height: height * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlue,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Image(
          image: const AssetImage('assets/images/logo1.png'),
          height: height * 0.1,
        ),
      ),
    );
  }

  Widget _buildBack(double width, double height, CardModel card) {
    return Container(
      key: const ValueKey(false),
      width: width * 0.2,
      height: height * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[350],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '${card.name}',
          style: TextStyle(
            fontSize: height * 0.05,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

List<CardModel> _createCardPairs() {
  var cards = [
    CardModel(id: 1, name: 'A'),
    CardModel(id: 2, name: 'B'),
    CardModel(id: 3, name: 'C'),
    CardModel(id: 4, name: 'D'),
    CardModel(id: 5, name: 'E'),
    CardModel(id: 6, name: 'F'),
    CardModel(id: 7, name: 'A'),
    CardModel(id: 8, name: 'B'),
    CardModel(id: 9, name: 'C'),
    CardModel(id: 10, name: 'D'),
    CardModel(id: 11, name: 'E'),
    CardModel(id: 12, name: 'F'),
  ];
  cards.shuffle();
  return cards;
}

class CardModel {
  final int id;
  final String name;
  bool isCorrect;
  bool isFlipped;

  CardModel({
    required this.id,
    required this.name,
    this.isCorrect = false,
    this.isFlipped = false,
  });
}
