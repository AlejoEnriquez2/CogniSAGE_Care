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
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 253, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        Text(
                          S.of(context).writeTuelveDifferent,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.formId == 1
                              ? S.of(context).writeTwelveDifferentAnimals
                              : S.of(context).countries,
                          style: const TextStyle(
                              fontSize: 25, fontStyle: FontStyle.italic),
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
                    const SizedBox(height: 40),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                            Container(
                              width: 150,
                              padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}
