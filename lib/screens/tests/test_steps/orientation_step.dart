import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/models/models.dart';

class OrientationStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;

  const OrientationStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.answersModel,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<OrientationStep> createState() => _OrientationStepState();
}

class _OrientationStepState extends State<OrientationStep> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.025, vertical: deviceHeight * 0.01),
      child: Column(children: [
        Container(
            height: deviceHeight * 0.6,
            width: deviceWidth * 0.95,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 253, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: deviceHeight * 0.02),
                    Column(
                      children: [
                        Text(
                          S.of(context).whatsTodaysDate,
                          style: TextStyle(
                              fontSize: deviceHeight * 0.035,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(S.of(context).inNumbersFromMemory,
                            style: TextStyle(fontSize: deviceHeight * 0.015)),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.02),
                    SizedBox(height: deviceHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: deviceWidth * 0.19,
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth * 0.01,
                              vertical: deviceHeight * 0.01),
                          child: Column(children: [
                            Text(
                              S.of(context).month,
                              style: TextStyle(fontSize: deviceHeight * 0.020),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                widget.answersModel.orientationMonth = value;
                              },
                              focusNode: widget.focusNodes[6],
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(widget.focusNodes[7]);
                              },
                              decoration: const InputDecoration(
                                labelText: 'MM',
                                prefixIcon: Icon(Icons.calendar_today_rounded),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ]),
                        ),
                        Container(
                          width: deviceWidth * 0.19,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Text(
                              S.of(context).date,
                              style: TextStyle(fontSize: deviceHeight * 0.020),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                widget.answersModel.orientationDay = value;
                              },
                              focusNode: widget.focusNodes[7],
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(widget.focusNodes[8]);
                              },
                              decoration: const InputDecoration(
                                labelText: 'DD',
                                prefixIcon: Icon(Icons.calendar_today_rounded),
                              ),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                            ),
                          ]),
                        ),
                        Container(
                          width: deviceWidth * 0.19,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Text(
                              S.of(context).year,
                              style: TextStyle(fontSize: deviceHeight * 0.020),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                widget.answersModel.orientationYear = value;
                              },
                              focusNode: widget.focusNodes[8],
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).unfocus();
                              },
                              decoration: const InputDecoration(
                                labelText: 'YYYY',
                                prefixIcon: Icon(Icons.calendar_today_rounded),
                              ),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                            ),
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.01),
                    // IconButton(
                    //   onPressed: () {
                    //     print(widget.answersModel.toRawJson());
                    //   },
                    //   icon: Icon(Icons.arrow_forward),
                    // ),
                    SizedBox(height: deviceHeight * 0.01),
                    SizedBox(height: deviceHeight * 0.01),
                    SizedBox(height: deviceHeight * 0.01),
                    SizedBox(height: deviceHeight * 0.01),
                    SizedBox(height: deviceHeight * 0.01),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}
