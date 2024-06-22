import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import 'package:frontend_form/screens/tests/steps.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  void refresh() {
    setState(() {});
  }

  int currentStep = 0;
  final _stepIcons = [
    Icons.person,
    Icons.palette,
    Icons.contact_page_rounded,
    Icons.home_repair_service_rounded,
  ];
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  TestModel testModel = TestModel();
  List<GlobalKey<FormState>> _formKeys =
      List.generate(4, (_) => GlobalKey<FormState>());

  @override
  Widget build(BuildContext context) {
    testModel.testDate = DateTime.now();
    testModel.formId = ModalRoute.of(context)!.settings.arguments as int;
    return Consumer<PatientProvider>(
        builder: (context, patientProvider, child) {
      if (!patientProvider.isLoggedIn) {
        Future.microtask(
            () => Navigator.pushReplacementNamed(context, 'login'));
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        final deviceHeight = MediaQuery.of(context).size.height;
        final deviceWidth = MediaQuery.of(context).size.width;
        return GestureDetector(
          onTap: () async {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text(
                  'SAGE Test Adaptation',
                  style: TextStyle(color: Colors.white),
                ),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'instructions');
                  },
                ),
                centerTitle: true,
              ),
              body: Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 37, 102, 183),
                        borderRadius:
                            BorderRadius.circular(deviceHeight * 0.015),
                      ),
                      child: SizedBox(
                        height: deviceHeight * 0.87,
                        width: deviceWidth * 0.95,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: deviceHeight * 0.015,
                                horizontal: deviceWidth * 0.025),
                            child: ChangeNotifierProvider(
                              create: (context) => TestProvider(),
                              child: Consumer<TestProvider>(
                                  builder: (context, testProvider, _) {
                                return Container(
                                  child: Stepper(
                                    // physics: const NeverScrollableScrollPhysics(),
                                    elevation: 10,
                                    type: StepperType.horizontal,
                                    currentStep: currentStep,
                                    onStepCancel: () => currentStep == 0
                                        ? null
                                        : setState(() {
                                            currentStep -= 1;
                                          }),
                                    onStepContinue: () {
                                      print('Current Step: ' +
                                          currentStep.toString());
                                      bool isLastStep = (currentStep ==
                                          getSteps().length - 1);
                                      if (isLastStep) {
                                        if (testModel.patientDepression ==
                                                null ||
                                            testModel.patientPersonality ==
                                                null ||
                                            testModel.patientDifficulties ==
                                                null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(S
                                                      .of(context)
                                                      .pleaseCompleteTheForm)));
                                        } else {
                                          Navigator.pushNamed(context, 'test',
                                              arguments: testModel);
                                        }
                                      } else {
                                        if (currentStep == 0) {
                                          if (_formKeys[currentStep]
                                              .currentState!
                                              .validate()) {
                                            if (testModel.patientGender ==
                                                null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(S
                                                          .of(context)
                                                          .pleaseCompleteTheForm)));

                                              return;
                                            } else {
                                              setState(() {
                                                currentStep += 1;
                                              });
                                              return;
                                            }
                                          }
                                        }
                                        if (currentStep == 1) {
                                          if (_formKeys[currentStep]
                                              .currentState!
                                              .validate()) {
                                            if (testModel.patientMemory ==
                                                    null ||
                                                testModel.patientRelatives ==
                                                    null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(S
                                                          .of(context)
                                                          .pleaseCompleteTheForm)));
                                              return;
                                            } else {
                                              setState(() {
                                                currentStep += 1;
                                              });
                                              return;
                                            }
                                          }
                                        }
                                        if (currentStep == 2) {
                                          if (testModel.patientBalance ==
                                                  null ||
                                              testModel.patientMajorStroke ==
                                                  null ||
                                              testModel.patientMinorStroke ==
                                                  null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(S
                                                        .of(context)
                                                        .pleaseCompleteTheForm)));
                                          } else {
                                            setState(() {
                                              currentStep += 1;
                                            });
                                            return;
                                          }
                                        }
                                      }
                                    },
                                    steps: getSteps(),
                                    stepIconBuilder: (index, state) {
                                      Color color = currentStep == index
                                          ? Colors.blue
                                          : (currentStep < index
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  155, 158, 158, 158));
                                      return Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Icon(
                                          _stepIcons[index],
                                          color: color,
                                          size: 25,
                                        ),
                                      );
                                    },
                                    controlsBuilder: (BuildContext context,
                                        ControlsDetails details) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(
                                                onPressed: details.onStepCancel,
                                                icon: const Icon(
                                                  Icons.arrow_back,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                  width: deviceWidth * 0.05),
                                              SizedBox(
                                                  width: deviceWidth * 0.05),
                                              ElevatedButton(
                                                onPressed: () {
                                                  print(testModel.toJson());
                                                  details.onStepContinue!();
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.yellow,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          deviceWidth * 0.015,
                                                      vertical:
                                                          deviceHeight * 0.004),
                                                ),
                                                child: Text(
                                                  S.of(context).continueTxt,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height: deviceHeight * 0.025),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: deviceHeight * 0.15,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: BottomAppBar(
                              height: deviceHeight * 0.05,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  IconButton(
                                    onPressed: () {
                                      int currentFocus = focusNodes
                                          .indexWhere((node) => node.hasFocus);
                                      if (currentFocus >= 0 &&
                                          currentFocus <
                                              focusNodes.length - 1) {
                                        if (currentFocus == 2 ||
                                            currentFocus == 3) {
                                          print('Do nothing - FormField: ' +
                                              currentFocus.toString());
                                          FocusScope.of(context).unfocus();
                                        } else {
                                          print('FormField: ' +
                                              currentFocus.toString());
                                          FocusScope.of(context).requestFocus(
                                              focusNodes[currentFocus + 1]);
                                        }
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: deviceHeight * 0.01,
                            left: deviceWidth * 0.424,
                            child: Container(
                              width: deviceWidth * 0.145,
                              height: deviceHeight * 0.11,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo1.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        );
      }
    });
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text(''),
        content: PersonalStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          testModel: testModel,
          formKey: _formKeys[0],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text(''),
        content: RelativesStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          testModel: testModel,
          formKey: _formKeys[1],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text(''),
        content: MedicalStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          testModel: testModel,
        ),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: const Text(''),
        content: MentalStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          testModel: testModel,
        ),
      ),
    ];
  }
}
