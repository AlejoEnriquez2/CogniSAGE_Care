import 'package:flutter/material.dart';
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
                  const Text(
                    'Do you currently feel sad or depressed?',
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
                              const Text('Yes')
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
                              const Text('Sometimes')
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
                              const Text('No')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Have you had any change in your personality?',
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
                              const Text('Yes')
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
                            decoration: const InputDecoration(
                              labelText: 'Specify changes',
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
                              const Text('No')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Do you have more difficulties doing everyday activites due to thinking problems?',
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
                              const Text('Yes')
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
                              const Text('No')
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
