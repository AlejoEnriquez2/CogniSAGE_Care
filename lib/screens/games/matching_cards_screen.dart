import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/providers/card_provider.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:provider/provider.dart';

class MatchingCardsScreen extends StatelessWidget {
  const MatchingCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of(context);

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    var cards = [
      CardModel(id: 1, name: 'A', isCorrect: false),
      CardModel(id: 2, name: 'B', isCorrect: false),
      CardModel(id: 3, name: 'C', isCorrect: false),
      CardModel(id: 4, name: 'D', isCorrect: false),
      CardModel(id: 5, name: 'E', isCorrect: false),
      CardModel(id: 6, name: 'F', isCorrect: false),
    ];
    cards.shuffle();

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
            // Navigator.pop(context);
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
                          'Correct: ',
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
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CardCustom(card: cards[0]),
                                  CardCustom(card: cards[1]),
                                  CardCustom(card: cards[2]),
                                  CardCustom(card: cards[3]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CardCustom(card: cards[4]),
                                  CardCustom(card: cards[5]),
                                  CardCustom(card: cards[0]),
                                  CardCustom(card: cards[1]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CardCustom(card: cards[2]),
                                  CardCustom(card: cards[3]),
                                  CardCustom(card: cards[4]),
                                  CardCustom(card: cards[5]),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.pushReplacementNamed(
                                //   context,
                                //   'personal',
                                //   arguments: testProvider.test.formId,
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                S.of(context).continueTxt,
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
                        children: [
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
      // color: const Color.fromARGB(255, 37, 102, 183),
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

  CardCustom({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  State<CardCustom> createState() => _CardCustomState();
}

class _CardCustomState extends State<CardCustom> {
  bool _showFrontSide = true;

  void _flipCard() {
    setState(() {
      print('flips the card');
      _showFrontSide = !_showFrontSide;
    });
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
              ? _buildFront(deviceWidth, deviceHeight)
              : _buildBack(deviceWidth, deviceHeight, widget.card),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
        ));
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
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
