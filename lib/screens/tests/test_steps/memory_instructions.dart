import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class MemoryInstructionsStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;
  final int formId;

  const MemoryInstructionsStep({
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
  State<MemoryInstructionsStep> createState() => _MemoryInstructionsStepState();
}

class _MemoryInstructionsStepState extends State<MemoryInstructionsStep> {
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
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.07),
              child: Column(
                children: [
                  SizedBox(height: deviceHeight * 0.025),
                  Text(
                    S.of(context).memoryTest,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: deviceHeight * 0.035),
                  Text(
                    S.of(context).memorizeThisPhrase,
                    style: TextStyle(fontSize: deviceHeight * 0.02),
                  ),
                  SizedBox(height: deviceHeight * 0.045),
                  Text(
                    S.of(context).inTheFinalSection,
                    style: TextStyle(fontSize: deviceHeight * 0.015),
                  ),
                  SizedBox(height: deviceHeight * 0.045),
                  Text(
                      widget.formId == 1
                          ? S.of(context).iAmDone
                          : S.of(context).instruction_finish_last_page,
                      style: TextStyle(
                        fontSize: deviceHeight * 0.025,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: deviceHeight * 0.03),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
