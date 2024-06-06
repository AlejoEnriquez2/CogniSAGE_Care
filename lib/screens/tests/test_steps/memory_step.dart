import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class MemoryStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;
  final int formId;

  const MemoryStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.answersModel,
    required this.formId,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<MemoryStep> createState() => _MemoryStepState();
}

class _MemoryStepState extends State<MemoryStep> {
  final TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.60,
          width: MediaQuery.of(context).size.width - 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 253, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    S.of(context).memoryTest,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  Text(
                    widget.formId == 1
                        ? S.of(context).haveYouFinished
                        : S.of(context).areYouDone,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    onChanged: (value) {
                      widget.answersModel.memoryPhrase = value;
                    },
                    focusNode: widget.focusNodes[26],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(widget.focusNodes[27]);
                    },
                    decoration: const InputDecoration(
                      labelText: '',
                      prefixIcon: Icon(Icons.edit),
                    ),
                    textInputAction: TextInputAction.done,
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
