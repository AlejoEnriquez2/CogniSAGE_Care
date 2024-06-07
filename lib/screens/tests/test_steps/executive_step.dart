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
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
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
                                  S.of(context).solveFollowing,
                                  style: TextStyle(
                                    fontSize: deviceHeight * 0.025,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: deviceHeight * 0.01),
                                SizedBox(
                                  width: deviceWidth * 0.3,
                                  child: Text(
                                    widget.formId == 1
                                        ? S.of(context).startWithTwoShapes
                                        : S
                                            .of(context)
                                            .instruction_start_with_triangles,
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
                            SizedBox(
                              height: deviceHeight * 0.16,
                              width: deviceWidth * 0.35,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    widget.formId == 1
                                        ? S.of(context).crossOutFourLines
                                        : S
                                            .of(context)
                                            .instruction_cross_out_lines,
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.015),
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
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
