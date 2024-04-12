import 'package:flutter/material.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class PersonalInformationStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;

  const PersonalInformationStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<PersonalInformationStep> createState() =>
      _PersonalInformationStepState();
}

class _PersonalInformationStepState extends State<PersonalInformationStep> {
  final TestProvider testProvider = TestProvider();
  static TestModel testModel = TestModel();

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
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'What is your name?',
                      style: TextStyle(fontSize: 25),
                    ),
                    TextFormField(
                      onChanged: (value) => testModel.patientName = value,
                      focusNode: widget.focusNodes[0],
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(widget.focusNodes[1]);
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
                      onChanged: (value) => testModel.patientBirthday = value,
                      focusNode: widget.focusNodes[1],
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(widget.focusNodes[2]);
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
                      onChanged: (value) => testModel.patientEducation = value,
                      focusNode: widget.focusNodes[2],
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(widget.focusNodes[3]);
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
                          color: testModel.patientGender == 'man'
                              ? Colors.green
                              : const Color.fromARGB(255, 204, 204, 204),
                          child: Container(
                            height: 120,
                            width: 100,
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.male,
                                    size: 75,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      testModel.patientGender = 'man';
                                      testProvider.updateGender(true);
                                      widget.refreshMainScreen();
                                      print('It is a man');
                                    });
                                  },
                                ),
                                Text('Man')
                              ],
                            ),
                          ),
                        ),
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(50),
                          color: testModel.patientGender == 'woman'
                              ? Colors.green
                              : const Color.fromARGB(255, 204, 204, 204),
                          child: Container(
                            height: 120,
                            width: 100,
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.female,
                                    size: 75,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      testModel.patientGender = 'woman';
                                      testProvider.updateGender(false);
                                      print('It is a woman');
                                    });
                                  },
                                ),
                                Text('Woman')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}
