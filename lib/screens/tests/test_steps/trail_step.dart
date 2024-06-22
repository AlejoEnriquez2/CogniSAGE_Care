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
  final bool isActive;

  const TrailStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.answersModel,
    required this.formId,
    required this.isActive,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<TrailStep> createState() => _TrailStepState();
}

class _TrailStepState extends State<TrailStep> {
  final TestProvider testProvider = TestProvider();
  bool _isRowVisible = true;
  bool _dialogShown = false;

  @override
  void didUpdateWidget(covariant TrailStep oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !_dialogShown) {
      _dialogShown = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showInstructionsDialog();
      });
    }
  }

  void _showInstructionsDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            S.of(context).instructionsTitle,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.014,
                fontStyle: FontStyle.italic),
          ),
          content: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                children: [
                  Text(
                    S.of(context).exampleCheck,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    S.of(context).instructionsDetail,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.013),
                  ),
                  Image.asset(
                    'assets/images/instructions.gif',
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).continueTxt),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                        _showInstructionsDialog();
                      },
                    ),
                    top: 0,
                    left: 0,
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
                                  S.of(context).connectTheDots,
                                  style: TextStyle(
                                    fontSize: 33,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: 200,
                                  child: Text(
                                      S.of(context).drawLineCircleToCircle),
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
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
