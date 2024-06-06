import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/widgets/trail_board.dart';

class TrailStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;
  final int formId;

  const TrailStep({
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
  State<TrailStep> createState() => _TrailStepState();
}

class _TrailStepState extends State<TrailStep> {
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
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              S.of(context).connectTheDots,
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 200,
                              child: Text(S.of(context).drawLineCircleToCircle),
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
                          child: Image.asset('assets/images/trail.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 650,
                      width: 550,
                      child: TrailBoard(
                        canvaSize: 550,
                        type: 'draw',
                        answersModel: widget.answersModel,
                        formId: widget.formId,
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
