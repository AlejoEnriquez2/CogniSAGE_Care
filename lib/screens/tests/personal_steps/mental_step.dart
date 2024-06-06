import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class MentalStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final TestModel testModel;

  const MentalStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.testModel,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<MentalStep> createState() => _MentalStepState();
}

class _MentalStepState extends State<MentalStep> {
  final TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.65,
          width: MediaQuery.of(context).size.width - 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 253, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    S.of(context).doYouCurrentlyFeelSadOrDepressed,
                    style: TextStyle(fontSize: 23),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientDepression == 'yes'
                            ? Colors.green
                            : const Color.fromARGB(255, 204, 204, 204),
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.check_rounded,
                                  size: 75,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.testModel.patientDepression = 'yes';
                                    testProvider.updateDepression('yes');
                                  });
                                },
                              ),
                              Text(S.of(context).yes)
                            ],
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color:
                            widget.testModel.patientDepression == 'occasionally'
                                ? Colors.green
                                : const Color.fromARGB(255, 204, 204, 204),
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.circle_outlined,
                                  size: 65,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.testModel.patientDepression =
                                        'occasionally';
                                    testProvider
                                        .updateDepression('occasionally');
                                  });
                                },
                              ),
                              Text(S.of(context).sometimes)
                            ],
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientDepression == 'no'
                            ? Colors.green
                            : const Color.fromARGB(255, 204, 204, 204),
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.close_rounded,
                                  size: 75,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.testModel.patientDepression = 'no';
                                    testProvider.updateDepression('no');
                                  });
                                },
                              ),
                              Text(S.of(context).no)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    S.of(context).haveYouHadAnyChangeInYourPersonality,
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientPersonality != null &&
                                widget.testModel.patientPersonality?[0] == 'y'
                            ? Colors.green
                            : const Color.fromARGB(255, 204, 204, 204),
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.check_rounded,
                                  size: 75,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.testModel.patientPersonality = 'yes';
                                    testProvider.updatePersonality('yes');
                                    print('YES!');
                                  });
                                },
                              ),
                              Text(S.of(context).yes)
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.testModel.patientPersonality != null &&
                            widget.testModel.patientPersonality?[0] == 'y',
                        child: SizedBox(
                          width: 200,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                widget.testModel.patientPersonality =
                                    'yes$value';
                                widget.onRefresh();
                                print(widget.testModel.patientPersonality);
                              });
                            },
                            focusNode: widget.focusNodes[5],
                            decoration: InputDecoration(
                              labelText: S.of(context).specifyChanges,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientPersonality != null &&
                                widget.testModel.patientPersonality?[0] == 'n'
                            ? Colors.green
                            : const Color.fromARGB(255, 204, 204, 204),
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.close_rounded,
                                  size: 75,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.testModel.patientPersonality = 'no';
                                    testProvider.updatePersonality('no');
                                    print('NO!');
                                  });
                                },
                              ),
                              Text(S.of(context).no)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text(
                    S
                        .of(context)
                        .doYouHaveMoreDifficultiesDoingEverydayActivitiesDueToThinkingProblems,
                    style: TextStyle(fontSize: 23),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientDifficulties == true
                            ? Colors.green
                            : const Color.fromARGB(255, 204, 204, 204),
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.check_rounded,
                                  size: 75,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.testModel.patientDifficulties = true;
                                    testProvider.updateDifficulties(true);
                                  });
                                },
                              ),
                              Text(S.of(context).yes)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 0),
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientDifficulties == false
                            ? Colors.green
                            : const Color.fromARGB(255, 204, 204, 204),
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.close_rounded,
                                  size: 75,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.testModel.patientDifficulties =
                                        false;
                                    testProvider.updateDifficulties(false);
                                  });
                                },
                              ),
                              Text(S.of(context).no)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
