import 'package:flutter/material.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class CalculationStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;

  const CalculationStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.answersModel,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<CalculationStep> createState() => _CalculationStepState();
}

class _CalculationStepState extends State<CalculationStep> {
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
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Calculate the following:',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'How many nickels are in 60 cents?',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        widget.answersModel.calculation1 = double.parse(value);
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
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                  const SizedBox(height: 80),
                  const Text(
                    'You are buying \$13.45 of groceries. How much change would you receive back from a \$20 bill?',
                    style: TextStyle(fontSize: 23),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        widget.answersModel.calculation2 = double.parse(value);
                      });
                    },
                    focusNode: widget.focusNodes[13],
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(widget.focusNodes[14]);
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
