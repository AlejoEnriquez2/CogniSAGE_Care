import 'package:flutter/material.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class RelativesStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final TestModel testModel;
  final GlobalKey<FormState> formKey;

  const RelativesStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.testModel,
    required this.formKey,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<RelativesStep> createState() => _RelativesStepState();
}

class _RelativesStepState extends State<RelativesStep> {
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
          child: Form(
            key: widget.formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'My ethnical background is: ',
                      style: TextStyle(fontSize: 25),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          widget.testModel.patientRace = value;
                        });
                      },
                      focusNode: widget.focusNodes[3],
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(widget.focusNodes[4]);
                      },
                      decoration: const InputDecoration(
                        labelText: 'asian, black, hispanic, white, etc.',
                        prefixIcon: Icon(Icons.edit_square),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your race';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'Have you had any problems with memory or thinking?',
                      style: TextStyle(fontSize: 23),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(50),
                          color: widget.testModel.patientMemory == 'yes'
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
                                      widget.testModel.patientMemory = 'yes';
                                      testProvider.updateMemoryProblems('yes');
                                      print('YES!');
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
                              widget.testModel.patientMemory == 'occasionally'
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
                                      widget.testModel.patientMemory =
                                          'occasionally';
                                      testProvider
                                          .updateMemoryProblems('occasionally');
                                      print('Sometimes!');
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
                          color: widget.testModel.patientMemory == 'no'
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
                                      widget.testModel.patientMemory = 'no';
                                      testProvider.updateMemoryProblems('no');
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
                      'Have you had any blood relatives that have had problems with memory or thinking?',
                      style: TextStyle(fontSize: 23),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(50),
                          color: widget.testModel.patientRelatives == true
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
                                      widget.testModel.patientRelatives = true;
                                      testProvider.updateRelatives(true);
                                      print('YES!');
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
                          color: widget.testModel.patientRelatives == false
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
                                      widget.testModel.patientRelatives = false;
                                      testProvider.updateRelatives(false);
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
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
