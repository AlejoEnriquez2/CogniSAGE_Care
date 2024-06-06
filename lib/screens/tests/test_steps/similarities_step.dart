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
                  Text(
                    S.of(context).answerTheseQuestions,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    widget.formId == 1
                        ? S.of(context).howAreWatchAndRulerSimilar
                        : S.of(context).howAreARoseAndATulipSimilar,
                    style: const TextStyle(fontSize: 25),
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
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    widget.formId == 1
                        ? S.of(context).howManyNickelsInSixtyCents
                        : S.of(context).question_quarters_in_euros,
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
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
                    decoration: const InputDecoration(
                      labelText: '\$ ',
                      prefixIcon: Icon(Icons.edit_square),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    widget.formId == 1
                        ? S.of(context).changeFromTwentyDollarBill
                        : S.of(context).question_groceries_change,
                    style: TextStyle(fontSize: 23),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value != '') {
                          widget.answersModel.calculation2 =
                              double.parse(value);
                        }
                      });
                    },
                    focusNode: widget.focusNodes[13],
                    onFieldSubmitted: (_) {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                    },
                    decoration: const InputDecoration(
                      labelText: '\$',
                      prefixIcon: Icon(Icons.edit_square),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
