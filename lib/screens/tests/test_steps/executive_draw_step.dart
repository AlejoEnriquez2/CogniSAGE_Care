import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/widgets/executive_draw_board.dart';
import 'package:frontend_form/widgets/show_byte_image_widget.dart';

class ExecutiveDrawStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;
  final int formId;

  const ExecutiveDrawStep({
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
                              S.of(context).drawYourAnswer,
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
                                    ? S.of(context).finalResultFourSquares
                                    : S
                                        .of(context)
                                        .rule_complete_triangle_lines,
                                style: TextStyle(fontSize: 17),
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
                        FutureBuilder(
                          // Wait for 3 seconds
                          future: Future.delayed(Duration(seconds: 1)),
                          builder: (context, snapshot) {
                            // While the Future is not completed, show a CircularProgressIndicator
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return CircularProgressIndicator();
                            }

                            // Once the Future is completed, show the ShowImageWidget
                            return SizedBox(
                                height: 200,
                                width: 250,
                                child: widget.answersModel.executiveLinesDraw !=
                                        null
                                    ? ShowImageWidget(
                                        imageBytes: base64Decode(
                                        widget.answersModel
                                            .executiveLinesDraw![0],
                                      ))
                                    : const Text('Image not found'));
                          },
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                    SizedBox(
                      height: 650,
                      width: 550,
                      child: ExecutiveDrawBoard(
                        canvaSize: 550,
                        type: 'executive',
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
