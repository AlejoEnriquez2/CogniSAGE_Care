import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:provider/provider.dart';

class MatchingCardsInstructionsScreen extends StatelessWidget {
  const MatchingCardsInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TestProvider testProvider = Provider.of(context);
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
            // Navigator.pushReplacementNamed(context, 'all_games');
            Navigator.pop(context);
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
                          'How to play this game?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceHeight * 0.1,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: deviceHeight * 0.05),
                        Container(
                          padding: EdgeInsets.all(deviceHeight * 0.02),
                          width: deviceWidth * 0.88,
                          height: deviceHeight * 0.37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'You will have for a few seconds the chance to review the order of the cards, then the cards will flip and you will have to touch them to flip them back and match them. You will have to match all the cards to win the game.',
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.02),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(height: deviceHeight * 0.025),
                              Text(
                                'This game is designed to test your memory and attention skills. It is important to focus and try to remember the order of the cards as best as you can. And don\'t forget about the ones you already discovered, they will help you to match the rest of the cards. Good luck!',
                                style:
                                    TextStyle(fontSize: deviceHeight * 0.015),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: deviceHeight * 0.02),
                              Text(
                                'Have fun!',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: deviceHeight * 0.02),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  'matching_cards',
                                  arguments: testProvider.test.formId,
                                );
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
                                  fontSize: deviceHeight * 0.015,
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
