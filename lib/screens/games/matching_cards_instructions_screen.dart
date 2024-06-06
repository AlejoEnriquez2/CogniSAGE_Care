import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:provider/provider.dart';

class MatchingCardsInstructionsScreen extends StatelessWidget {
  const MatchingCardsInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TestProvider testProvider = Provider.of(context);

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
                height: MediaQuery.of(context).size.height - 150,
                width: MediaQuery.of(context).size.width - 50,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        const Text(
                          'How to play this game?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 125,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 60),
                        Container(
                          padding: const EdgeInsets.all(25),
                          width: 700,
                          height: 450,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: const Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'You will have for a few seconds the chance to review the order of the cards, then the cards will flip and you will have to touch them to flip them back and match them. You will have to match all the cards to win the game.',
                                  style: TextStyle(fontSize: 27),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'This game is designed to test your memory and attention skills. It is important to focus and try to remember the order of the cards as best as you can. And don\'t forget about the ones you already discovered, they will help you to match the rest of the cards. Good luck!',
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: 26),
                              Text(
                                'Have fun!',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
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
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
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
              height: 160,
              child: Stack(
                children: [
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: BottomAppBar(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: MediaQuery.of(context).size.width / 2 - 62.5,
                    child: Container(
                      width: 125,
                      height: 140,
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
