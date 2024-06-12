import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/models/game_model.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../services/services.dart';

class AllGamesScreen extends StatelessWidget {
  const AllGamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseService = Provider.of<DatabaseService>(context);
    return Builder(builder: (BuildContext innerContext) {
      return Consumer<PatientProvider>(
          builder: (context, patientProvider, child) {
        if (!patientProvider.isLoggedIn) {
          Future.microtask(
            () => Navigator.pushReplacementNamed(context, 'login'),
          );
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return FutureBuilder<Patient>(
          future: databaseService.getPatientInfo(),
          builder: (context, AsyncSnapshot<Patient> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        title: Text(
                          S.of(context).myInformation,
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'home');
                          },
                        ),
                        centerTitle: true,
                      ),
                      body: Center(
                        child: Text(snapshot.error.toString(),
                            style: TextStyle(color: Colors.white)),
                      )));
            } else {
              print("GETS INSIDE THE ELSE");
              Patient patient = snapshot.data!;
              print(patient.toJson());
              return GamesListCustom(
                  patient: patient, patientProvider: patientProvider);
            }
          },
        );
        // return Scaffold(body: UserInfoCustom(patientProvider: patientProvider));
      });
    });
  }
}

class GamesListCustom extends StatelessWidget {
  final PatientProvider patientProvider;
  final Patient patient;

  const GamesListCustom({
    super.key,
    required this.patientProvider,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    List<GameModel> games = [
      GameModel(
        id: '1',
        name: 'Matching Cards',
        focus: ['Memory Skills', 'Image Recognition', 'Visual Memory'],
        description:
            'This is a game where you have to memorize and match the cards',
        imageName: 'game1.png',
      ),
      GameModel(
        id: '2',
        name: 'Name the Object',
        focus: [
          'Language Skills',
          'Object Perception',
          'Cognitive Stimulation'
        ],
        description:
            'In this game you will be challenged to name the objects in the images',
        imageName: 'game2.png',
      ),
      GameModel(
        id: '3',
        name: 'Math Practice',
        focus: ['Reasoning Skills', 'Mental Agility', 'Problem Solving'],
        description:
            'This is a game where you will have to solve simple math problems',
        imageName: 'game3.png',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'List of all games',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 37, 102, 183),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                height: deviceHeight * 0.89,
                width: deviceWidth * 0.94,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(deviceHeight * 0.017),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: deviceWidth * 0.19,
                                height: deviceHeight * 0.14,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/logo1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: deviceWidth * 0.05),
                              Text(
                                '${S.of(context).welcome} ${patient.name}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: deviceHeight * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: deviceHeight * 0.02),
                          Container(
                            padding: const EdgeInsets.all(0),
                            width: deviceWidth * 0.9,
                            // height: deviceHeight * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, 'matching_instructions');
                                      },
                                      child: GameCardCustom(
                                        recommendation: 1,
                                        game: games[0],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, 'guess_word');
                                      },
                                      child: GameCardCustom(
                                        recommendation: 2,
                                        game: games[1],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: deviceHeight * 0.02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, 'math');
                                      },
                                      child: GameCardCustom(
                                        recommendation: 3,
                                        game: games[2],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: deviceHeight * 0.02),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // GameCardCustom(),
                                    // GameCardCustom(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GameCardCustom extends StatelessWidget {
  int recommendation;
  GameModel game;

  GameCardCustom({
    required this.recommendation,
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    var rec = '';
    if (recommendation == 1) {
      rec = '1.- Most recommended';
    } else {
      rec = recommendation.toString();
    }
    return Container(
      padding: const EdgeInsets.all(0),
      width: deviceWidth * 0.43,
      height: deviceHeight * 0.31,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 5, 53, 107).withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(3,
                3), // Modify the offset values to make the shadow go towards the right bottom way
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.only(
                left: 5,
                right: 10,
                top: 5,
                bottom: 5,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 241, 222),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: SizedBox(
                width: recommendation == 1
                    ? deviceWidth * 0.25
                    : deviceWidth * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    recommendation == 1
                        ? Icon(Icons.star_purple500_outlined,
                            color: Colors.red, size: deviceHeight * 0.016)
                        : Icon(Icons.star_border,
                            color: Colors.red, size: deviceHeight * 0.016),
                    Text(rec,
                        style: TextStyle(
                            color: Color.fromARGB(255, 244, 91, 49),
                            fontSize: deviceHeight * 0.011)),
                    const SizedBox(),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 40,
            child: Container(
              padding: const EdgeInsets.all(0),
              width: deviceWidth * 0.4,
              height: deviceHeight * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    game.name,
                    style: TextStyle(
                      fontSize: deviceHeight * 0.019,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const Text(
                  //   '100 high score',
                  //   style: TextStyle(fontSize: 14),
                  // ),
                  Image.asset('assets/games/${game.imageName}',
                      width: deviceWidth * 0.38),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth * 0.005,
                        vertical: deviceHeight * 0.003),
                    child: Divider(),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Expanded(child: SizedBox()),
                          const Expanded(child: Icon(Icons.check)),
                          Expanded(
                              flex: 3,
                              child: Text(game.focus[0],
                                  style: TextStyle(
                                      fontSize: deviceHeight * 0.012))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Expanded(child: SizedBox()),
                          const Expanded(child: Icon(Icons.check)),
                          Expanded(
                            flex: 3,
                            child: Text(game.focus[1],
                                style:
                                    TextStyle(fontSize: deviceHeight * 0.012)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Expanded(child: SizedBox()),
                          const Expanded(child: Icon(Icons.check)),
                          Expanded(
                            flex: 3,
                            child: Text(game.focus[2],
                                style:
                                    TextStyle(fontSize: deviceHeight * 0.012)),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
