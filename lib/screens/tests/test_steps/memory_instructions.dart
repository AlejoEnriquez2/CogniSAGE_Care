import 'package:flutter/material.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class MemoryInstructionsStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;

  const MemoryInstructionsStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.answersModel,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<MemoryInstructionsStep> createState() => _MemoryInstructionsStepState();
}

class _MemoryInstructionsStepState extends State<MemoryInstructionsStep> {
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
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Memory Test',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Memorize this phrase',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'In the final section, you will be asked to write this phrase.',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 50),
                  Text('I am done',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
