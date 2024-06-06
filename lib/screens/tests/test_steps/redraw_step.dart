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
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
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
                            Text(S.of(context).copyRedrawThisImage),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: widget.formId == 1
                              ? Image.asset('assets/images/cube.png')
                              : Image.asset('assets/images/redraw.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 550,
                      width: 450,
                      child: DrawBoard(
                        canvaSize: 450,
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
