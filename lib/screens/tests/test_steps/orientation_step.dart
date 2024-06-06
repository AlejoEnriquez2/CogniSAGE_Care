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
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        Text(
                          S.of(context).whatsTodaysDate,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(S.of(context).inNumbersFromMemory),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 150,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Text(
                              S.of(context).month,
                              style: TextStyle(fontSize: 25),
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
                          width: 150,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Text(
                              S.of(context).date,
                              style: TextStyle(fontSize: 25),
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
                          width: 150,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Text(
                              S.of(context).year,
                              style: TextStyle(fontSize: 25),
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
                    const SizedBox(height: 10),
                    // IconButton(
                    //   onPressed: () {
                    //     print(widget.answersModel.toRawJson());
                    //   },
                    //   icon: Icon(Icons.arrow_forward),
                    // ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}
