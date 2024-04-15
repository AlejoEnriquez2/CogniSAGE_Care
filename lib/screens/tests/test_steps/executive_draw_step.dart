import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/screens/steps.dart';
import 'package:frontend_form/widgets/executive_board.dart';

class ExecutiveDrawStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;

  const ExecutiveDrawStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.answersModel,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<ExecutiveDrawStep> createState() => _ExecutiveDrawStepState();
}

class _ExecutiveDrawStepState extends State<ExecutiveDrawStep> {
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
                              'Draw your answer:',
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'With the 4 lines you took out, draw the final result of the 4 squares only',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 175,
                          child: VerticalDivider(
                            color: Color.fromARGB(255, 88, 88, 88),
                            thickness: 2,
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          width: 250,
                          child: ShowImageWidget(
                            imageBytes: Uint8List.fromList(
                                widget.answersModel.executiveTempDraw ?? []),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 650,
                      width: 550,
                      child: ExecutiveBoard(
                        canvaSize: 550,
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
