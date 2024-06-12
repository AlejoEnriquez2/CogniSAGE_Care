import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class SimilaritiesStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;
  final int formId;

  const SimilaritiesStep({
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
  State<SimilaritiesStep> createState() => _SimilaritiesStepState();
}

class _SimilaritiesStepState extends State<SimilaritiesStep> {
  final TestProvider testProvider = TestProvider();

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
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
              child: Column(
                children: [
                  SizedBox(height: deviceHeight * 0.025),
                  Text(
                    S.of(context).answerTheseQuestions,
                    style: TextStyle(
                        fontSize: deviceHeight * 0.03,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: deviceHeight * 0.03),
                  Text(
                    widget.formId == 1
                        ? S.of(context).howAreWatchAndRulerSimilar
                        : S.of(context).howAreARoseAndATulipSimilar,
                    style: TextStyle(fontSize: deviceHeight * 0.02),
                    textAlign: TextAlign.center,
                  ),
                  // const SizedBox(height: 10),
                  // Text(S.of(context).writeDownHowTheyAreAlike),
                  // const SizedBox(height: 30),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        widget.answersModel.similarities = value;
                      });
                    },
                    focusNode: widget.focusNodes[11],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(widget.focusNodes[12]);
                    },
                    decoration: InputDecoration(
                      labelText: S.of(context).theyBothAre,
                      prefixIcon: Icon(Icons.edit_square),
                      labelStyle: TextStyle(fontSize: deviceHeight * 0.013),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: deviceHeight * 0.015),
                  ),
                  SizedBox(height: deviceHeight * 0.03),
                  Text(
                    widget.formId == 1
                        ? S.of(context).howManyNickelsInSixtyCents
                        : S.of(context).question_quarters_in_euros,
                    style: TextStyle(fontSize: deviceHeight * 0.02),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: deviceHeight * 0.01),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value != '') {
                          widget.answersModel.calculation1 =
                              double.parse(value);
                        }
                      });
                    },
                    focusNode: widget.focusNodes[12],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(widget.focusNodes[13]);
                    },
                    decoration: InputDecoration(
                      labelText: '\$ ',
                      prefixIcon: Icon(Icons.edit_square),
                      labelStyle: TextStyle(fontSize: deviceHeight * 0.013),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: deviceHeight * 0.015),
                  ),
                  SizedBox(height: deviceHeight * 0.04),
                  Text(
                    widget.formId == 1
                        ? S.of(context).changeFromTwentyDollarBill
                        : S.of(context).question_groceries_change,
                    style: TextStyle(fontSize: deviceHeight * 0.02),
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value != '' && double.tryParse(value) != null) {
                          widget.answersModel.calculation2 =
                              double.parse(value);
                        }
                      });
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                    focusNode: widget.focusNodes[13],
                    onFieldSubmitted: (_) {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                    },
                    decoration: InputDecoration(
                      labelText: '\$',
                      prefixIcon: Icon(Icons.edit_square),
                      labelStyle: TextStyle(fontSize: deviceHeight * 0.013),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(fontSize: deviceHeight * 0.015),
                  ),
                  SizedBox(height: deviceHeight * 0.03),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
