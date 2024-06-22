import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class RelativesStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final TestModel testModel;
  final GlobalKey<FormState> formKey;

  const RelativesStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.testModel,
    required this.formKey,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<RelativesStep> createState() => _RelativesStepState();
}

class _RelativesStepState extends State<RelativesStep> {
  final TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceHeight * 0.03, vertical: deviceWidth * 0.01),
      child: Column(children: [
        Container(
          height: deviceHeight * 0.65,
          width: deviceWidth * 0.9,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 253, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Form(
            key: widget.formKey,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.09),
                child: Column(
                  children: [
                    SizedBox(height: deviceHeight * 0.025),
                    Text(
                      S.of(context).haveYouHadAnyProblemsWithMemoryOrThinking,
                      style: TextStyle(fontSize: deviceHeight * 0.019),
                    ),
                    SizedBox(height: deviceHeight * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(50),
                          color: widget.testModel.patientMemory == 'yes'
                              ? Colors.green
                              : const Color.fromARGB(255, 204, 204, 204),
                          child: Container(
                            height: deviceHeight * 0.1,
                            width: deviceWidth * 0.13,
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.check_rounded,
                                    size: deviceHeight * 0.06,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.testModel.patientMemory = 'yes';
                                      testProvider.updateMemoryProblems('yes');
                                      FocusScope.of(context).unfocus();
                                      print('YES!');
                                    });
                                  },
                                ),
                                Text(S.of(context).yes,
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.010))
                              ],
                            ),
                          ),
                        ),
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(50),
                          color:
                              widget.testModel.patientMemory == 'occasionally'
                                  ? Colors.green
                                  : const Color.fromARGB(255, 204, 204, 204),
                          child: Container(
                            height: deviceHeight * 0.1,
                            width: deviceWidth * 0.13,
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.circle_outlined,
                                    size: deviceHeight * 0.06,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.testModel.patientMemory =
                                          'occasionally';
                                      testProvider
                                          .updateMemoryProblems('occasionally');
                                      FocusScope.of(context).unfocus();
                                      print('Sometimes!');
                                    });
                                  },
                                ),
                                Text(S.of(context).sometimes,
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.010))
                              ],
                            ),
                          ),
                        ),
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(50),
                          color: widget.testModel.patientMemory == 'no'
                              ? Colors.green
                              : const Color.fromARGB(255, 204, 204, 204),
                          child: Container(
                            height: deviceHeight * 0.1,
                            width: deviceWidth * 0.13,
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    size: deviceHeight * 0.06,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.testModel.patientMemory = 'no';
                                      testProvider.updateMemoryProblems('no');
                                      FocusScope.of(context).unfocus();
                                      print('NO!');
                                    });
                                  },
                                ),
                                Text(S.of(context).no,
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.010))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.045),
                    Text(
                      S.of(context).haveYouHadAnyBloodRelativesWithProblems,
                      style: TextStyle(fontSize: deviceHeight * 0.018),
                    ),
                    SizedBox(height: deviceHeight * 0.030),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(50),
                          color: widget.testModel.patientRelatives == true
                              ? Colors.green
                              : const Color.fromARGB(255, 204, 204, 204),
                          child: Container(
                            height: deviceHeight * 0.1,
                            width: deviceWidth * 0.13,
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.check_rounded,
                                    size: deviceHeight * 0.06,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.testModel.patientRelatives = true;
                                      testProvider.updateRelatives(true);
                                      FocusScope.of(context).unfocus();
                                      print('YES!');
                                    });
                                  },
                                ),
                                Text(S.of(context).yes,
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.010))
                              ],
                            ),
                          ),
                        ),
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(50),
                          color: widget.testModel.patientRelatives == false
                              ? Colors.green
                              : const Color.fromARGB(255, 204, 204, 204),
                          child: Container(
                            height: deviceHeight * 0.1,
                            width: deviceWidth * 0.13,
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    size: deviceHeight * 0.06,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.testModel.patientRelatives = false;
                                      testProvider.updateRelatives(false);
                                      FocusScope.of(context).unfocus();
                                      print('NO!');
                                    });
                                  },
                                ),
                                Text(S.of(context).no,
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.010))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.035),
                    Text(
                      S.of(context).myEthnicalBackgroundIs,
                      style: TextStyle(fontSize: deviceHeight * 0.02),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          widget.testModel.patientRace = value;
                        });
                      },
                      focusNode: widget.focusNodes[3],
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(widget.focusNodes[4]);
                      },
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: deviceHeight * 0.012),
                        labelText:
                            S.of(context).pleaseEnterYourEthnicalBackground,
                        prefixIcon: Icon(Icons.edit_square),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S
                              .of(context)
                              .pleaseEnterYourEthnicalBackground;
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: deviceHeight * 0.015),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
