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
  bool _isRowVisible = true;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // IconButton(
                        //   icon: Icon(Icons.info),
                        //   onPressed: () {
                        //     setState(() {
                        //       _isRowVisible = !_isRowVisible;
                        //     });
                        //   },
                        // ),
                        if (_isRowVisible)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    S.of(context).draw,
                                    style: TextStyle(
                                      fontSize: deviceHeight * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: deviceHeight * 0.01),
                                  Text(S.of(context).followNextInstructions,
                                      style: TextStyle(
                                          fontSize: deviceHeight * 0.015)),
                                ],
                              ),
                              SizedBox(
                                height: deviceHeight * 0.11,
                                child: VerticalDivider(
                                  color: Color.fromARGB(255, 88, 88, 88),
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.12,
                                width: deviceWidth * 0.50,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      S.of(context).drawLargeClockFace,
                                      style: TextStyle(
                                        fontSize: deviceHeight * 0.014,
                                      ),
                                    ),
                                    Text(
                                      widget.formId == 1
                                          ? S.of(context).positionHandsForTime
                                          : S.of(context).positionHandsForTime4,
                                      style: TextStyle(
                                        fontSize: deviceHeight * 0.014,
                                      ),
                                    ),
                                    Text(
                                      S.of(context).labelClockHands,
                                      style: TextStyle(
                                        fontSize: deviceHeight * 0.014,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(
                      // height: 750,
                      width: deviceWidth * 0.80,
                      child: DrawBoard(
                        canvaSize: deviceWidth * 0.8,
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
