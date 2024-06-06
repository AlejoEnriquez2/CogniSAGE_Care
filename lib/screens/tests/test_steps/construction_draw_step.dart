import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/widgets/draw_board.dart';

class ConstructionDrawStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;
  final int formId;

  const ConstructionDrawStep({
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
  State<ConstructionDrawStep> createState() => _ConstructionDrawStepState();
}

class _ConstructionDrawStepState extends State<ConstructionDrawStep> {
  final TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              S.of(context).draw,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(S.of(context).followNextInstructions),
                          ],
                        ),
                        SizedBox(
                          height: 150,
                          child: VerticalDivider(
                            color: Color.fromARGB(255, 88, 88, 88),
                            thickness: 2,
                          ),
                        ),
                        SizedBox(
                          height: 175,
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                S.of(context).drawLargeClockFace,
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                widget.formId == 1
                                    ? S.of(context).positionHandsForTime
                                    : S.of(context).positionHandsForTime4,
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                S.of(context).labelClockHands,
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 750,
                      width: 650,
                      child: DrawBoard(
                        canvaSize: 650,
                        type: 'draw',
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
