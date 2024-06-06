import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class MedicalStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final TestModel testModel;

  const MedicalStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.testModel,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<MedicalStep> createState() => _MedicalStepState();
}

class _MedicalStepState extends State<MedicalStep> {
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
                    S.of(context).doYouHaveBalanceProblems,
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientBalance != null &&
                                widget.testModel.patientBalance?[0] == 'y'
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
                                    widget.testModel.patientBalance = 'yes';
                                    testProvider.updateBalanceProblems('yes');
                                    print('YES!');
                                  });
                                },
                              ),
                              Text(S.of(context).yes)
                            ],
                          ),
                        ),
                      ),
                      // if (widget.testModel.patientBalance!.substring(0, 2) ==
                      //     'ye')
                      Visibility(
                        visible: widget.testModel.patientBalance != null &&
                            widget.testModel.patientBalance?[0] == 'y',
                        child: SizedBox(
                          width: 200,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                widget.testModel.patientBalance = 'yes$value';
                                widget.onRefresh();
                                print(widget.testModel.patientBalance);
                              });
                            },
                            focusNode: widget.focusNodes[4],
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(
                                widget.focusNodes[5],
                              );
                            },
                            decoration: InputDecoration(
                              labelText: S.of(context).doYouKnowWhy,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientBalance != null &&
                                widget.testModel.patientBalance?[0] == 'n'
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
                                    widget.testModel.patientBalance = 'no';
                                    testProvider.updateBalanceProblems('no');
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
                  const SizedBox(height: 40),
                  Text(
                    S.of(context).haveYouHadAMajorStroke,
                    style: TextStyle(fontSize: 23),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientMajorStroke == true
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
                                    widget.testModel.patientMajorStroke = true;
                                    testProvider.updateMajorStroke(true);
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
                        color: widget.testModel.patientMajorStroke == false
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
                                    widget.testModel.patientMajorStroke = false;
                                    testProvider.updateMajorStroke(false);
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
                    S.of(context).haveYouHadAMinorStroke,
                    style: TextStyle(fontSize: 23),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientMinorStroke == true
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
                                    widget.testModel.patientMinorStroke = true;
                                    testProvider.updateMinorStroke(true);
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
                        color: widget.testModel.patientMinorStroke == false
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
                                    widget.testModel.patientMinorStroke = false;
                                    testProvider.updateMinorStroke(false);
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
