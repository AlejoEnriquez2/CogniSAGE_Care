import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/models/models.dart';

class WordStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;
  final int formId;

  const WordStep({
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
  State<WordStep> createState() => _WordStepState();
}

class _WordStepState extends State<WordStep> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.025, vertical: deviceHeight * 0.01),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: deviceHeight * 0.60,
              width: deviceWidth * 0.95,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 253, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
                  child: Column(
                    children: [
                      SizedBox(height: deviceHeight * 0.025),
                      Column(
                        children: [
                          Text(
                            S.of(context).writeTuelveDifferent,
                            style: TextStyle(
                                fontSize: deviceHeight * 0.035,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: deviceHeight * 0.01),
                          Text(
                            widget.formId == 1
                                ? S.of(context).writeTwelveDifferentAnimals
                                : S.of(context).countries,
                            style: TextStyle(
                                fontSize: deviceHeight * 0.022,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                          // Text.rich(
                          //   TextSpan(
                          //     text: "Different ",
                          //     style: TextStyle(fontSize: 20),
                          //     children: [
                          //       TextSpan(
                          //         text: "ANIMALS",
                          //         style: TextStyle(
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //       TextSpan(
                          //         text: " you can think of",
                          //         style: TextStyle(fontSize: 20),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: deviceHeight * 0.03),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w1 = value;
                                  },
                                  focusNode: widget.focusNodes[14],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[15]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w2 = value;
                                  },
                                  focusNode: widget.focusNodes[15],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[16]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w3 = value;
                                  },
                                  focusNode: widget.focusNodes[16],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[17]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: deviceHeight * 0.016),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w4 = value;
                                  },
                                  focusNode: widget.focusNodes[17],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[18]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w5 = value;
                                  },
                                  focusNode: widget.focusNodes[18],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[19]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w6 = value;
                                  },
                                  focusNode: widget.focusNodes[19],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[20]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: deviceHeight * 0.016),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w7 = value;
                                  },
                                  focusNode: widget.focusNodes[20],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[21]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w8 = value;
                                  },
                                  focusNode: widget.focusNodes[21],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[22]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w9 = value;
                                  },
                                  focusNode: widget.focusNodes[22],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[23]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: deviceHeight * 0.016),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w10 = value;
                                  },
                                  focusNode: widget.focusNodes[23],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[24]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w11 = value;
                                  },
                                  focusNode: widget.focusNodes[24],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(widget.focusNodes[25]);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                              Container(
                                width: deviceWidth * 0.19,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.008,
                                    vertical: deviceHeight * 0.008),
                                child: TextFormField(
                                  onChanged: (value) {
                                    widget.answersModel.w12 = value;
                                  },
                                  focusNode: widget.focusNodes[25],
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  decoration: const InputDecoration(
                                    labelText: '',
                                    prefixIcon: Icon(Icons.edit),
                                  ),
                                  style:
                                      TextStyle(fontSize: deviceHeight * 0.012),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: deviceHeight * 0.016),
                    ],
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
