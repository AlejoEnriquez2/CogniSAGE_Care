import 'package:flutter/material.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class PersonalStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final TestModel testModel;

  const PersonalStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.testModel,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<PersonalStep> createState() => _PersonalStepState();
}

class _PersonalStepState extends State<PersonalStep> {
  final TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
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
                    'Tell us about you',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'What is your name?',
                    style: TextStyle(fontSize: 25),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        widget.testModel.patientName = value;
                      });
                    },
                    focusNode: widget.focusNodes[0],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(widget.focusNodes[1]);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.edit_square),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'What is birthday?',
                    style: TextStyle(fontSize: 25),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        widget.testModel.patientBirthday = value;
                      });
                    },
                    focusNode: widget.focusNodes[1],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(widget.focusNodes[2]);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Birthday',
                      prefixIcon: Icon(Icons.date_range_rounded),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'How far did you get in school?',
                    style: TextStyle(fontSize: 25),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        widget.testModel.patientEducation = value;
                      });
                    },
                    focusNode: widget.focusNodes[2],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: const InputDecoration(
                      labelText: 'Studies',
                      prefixIcon: Icon(Icons.menu_book_outlined),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 30),
                  const Text(
                    'I am a:',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientGender == 'man'
                            ? Colors.green
                            : const Color.fromARGB(255, 204, 204, 204),
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.male,
                                  size: 75,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.testModel.patientGender = 'man';
                                    testProvider.updateGender(true);
                                    // widget.refreshMainScreen();
                                    print('It is a man');
                                  });
                                },
                              ),
                              const Text('Man')
                            ],
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        color: widget.testModel.patientGender == 'woman'
                            ? Colors.green
                            : const Color.fromARGB(255, 204, 204, 204),
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.female,
                                  size: 75,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.testModel.patientGender = 'woman';
                                    testProvider.updateGender(false);
                                    print('It is a woman');
                                  });
                                },
                              ),
                              const Text('Woman')
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
