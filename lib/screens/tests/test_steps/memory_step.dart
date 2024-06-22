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
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.025, vertical: deviceHeight * 0.01),
      child: Column(children: [
        Container(
          height: deviceHeight * 0.6,
          width: deviceWidth * 0.95,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 253, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.09),
              child: Column(
                children: [
                  SizedBox(height: deviceHeight * 0.04),
                  Text(
                    widget.formId == 1
                        ? S.of(context).haveYouFinished
                        : S.of(context).areYouDone,
                    style: TextStyle(fontSize: deviceHeight * 0.02),
                  ),
                  SizedBox(height: deviceHeight * 0.045),
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
                    style: TextStyle(fontSize: deviceHeight * 0.016),
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
