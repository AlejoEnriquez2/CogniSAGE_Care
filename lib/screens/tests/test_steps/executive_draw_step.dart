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
  bool _isRowVisible = true;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: _isRowVisible == true
                ? deviceHeight * 0.70
                : deviceHeight * 0.6,
            width: deviceWidth,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
                child: Stack(children: [
                  Positioned(
                    child: IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () {
                        setState(() {
                          _isRowVisible = !_isRowVisible;
                        });
                      },
                    ),
                    top: 0,
                    left: -10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_isRowVisible)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  S.of(context).drawYourAnswer,
                                  style: TextStyle(
                                    fontSize: deviceHeight * 0.025,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: deviceHeight * 0.01),
                                SizedBox(
                                  width: deviceWidth * 0.27,
                                  child: Text(
                                    widget.formId == 1
                                        ? S.of(context).finalResultFourSquares
                                        : S
                                            .of(context)
                                            .rule_complete_triangle_lines,
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.015),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: deviceHeight * 0.14,
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
                                    height: deviceHeight * 0.16,
                                    width: deviceWidth * 0.30,
                                    child: widget.answersModel
                                                .executiveLinesDraw !=
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
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
