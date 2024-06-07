import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/widgets/draw_board.dart';

class RedrawStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;
  final int formId;

  const RedrawStep({
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
  State<RedrawStep> createState() => _RedrawStepState();
}

class _RedrawStepState extends State<RedrawStep> {
  final TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.025, vertical: deviceHeight * 0.01),
      child: Column(
        children: [
          Container(
            height: deviceHeight * 0.65,
            width: deviceWidth * 0.95,
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
                        Column(
                          children: [
                            Text(
                              S.of(context).draw,
                              style: TextStyle(
                                fontSize: deviceHeight * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: deviceHeight * 0.015),
                            SizedBox(
                              width: deviceWidth * 0.3,
                              child: Text(
                                S.of(context).copyRedrawThisImage,
                                style:
                                    TextStyle(fontSize: deviceHeight * 0.013),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          // height: 200,
                          width: deviceWidth * 0.28,
                          child: widget.formId == 1
                              ? Image.asset('assets/images/cube.png')
                              : Image.asset('assets/images/redraw.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: deviceWidth * 0.5,
                      child: DrawBoard(
                        canvaSize: deviceWidth * 0.5,
                        type: 'redraw',
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
