import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/widgets/executive_board.dart';

class ExecutiveStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;
  final int formId;

  const ExecutiveStep({
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
  State<ExecutiveStep> createState() => _ExecutiveStepState();
}

class _ExecutiveStepState extends State<ExecutiveStep> {
  final TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              S.of(context).solveFollowing,
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.formId == 1
                                    ? S.of(context).startWithTwoShapes
                                    : S
                                        .of(context)
                                        .instruction_start_with_triangles,
                                style: const TextStyle(fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 175,
                          child: VerticalDivider(
                            color: Color.fromARGB(255, 88, 88, 88),
                            thickness: 2,
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.formId == 1
                                    ? S.of(context).crossOutFourLines
                                    : S.of(context).instruction_cross_out_lines,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 650,
                      width: 550,
                      child: ExecutiveBoard(
                        canvaSize: 550,
                        formId: widget.formId,
                        answersModel: widget.answersModel,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
