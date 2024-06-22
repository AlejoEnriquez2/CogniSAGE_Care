import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/services/services.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
import '../../models/models.dart';
import '../../providers/providers.dart';
import 'steps.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  void refresh() {
    setState(() {});
  }

  int currentStep = 0;
  final _stepIcons = [
    Icons.calendar_month,
    Icons.mms_outlined,
    Icons.psychology_rounded,
    Icons.menu_book_rounded,
    Icons.edit,
    Icons.api_rounded,
    Icons.text_fields_rounded,
    Icons.swap_horizontal_circle_rounded,
    Icons.edit_document,
    Icons.draw_rounded,
    Icons.flag,
  ];
  List<FocusNode> focusNodes = List.generate(40, (_) => FocusNode());

  AnswersModel answersModel = AnswersModel();
  int formId = 0;

  @override
  Widget build(BuildContext context) {
    TestModel testModel =
        ModalRoute.of(context)!.settings.arguments as TestModel;
    formId = testModel.formId!;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        return false;
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: currentStep == 5 ||
                          currentStep == 7 ||
                          currentStep == 8 ||
                          currentStep == 9
                      ? deviceHeight
                      : deviceHeight * 0.87,
                  width: currentStep == 5 ||
                          currentStep == 7 ||
                          currentStep == 8 ||
                          currentStep == 9
                      ? deviceWidth
                      : deviceWidth * 0.95,
                  child: Center(
                    child: Padding(
                      padding: currentStep == 5 ||
                              currentStep == 7 ||
                              currentStep == 8 ||
                              currentStep == 9
                          ? const EdgeInsets.all(0.0)
                          : const EdgeInsets.all(15.0),
                      child: ChangeNotifierProvider(
                        create: (context) => TestProvider(),
                        child: Consumer<TestProvider>(
                            builder: (context, testProvider, _) {
                          return Form(
                              key: testProvider.formKey,
                              child: Container(
                                child: Stepper(
                                  physics: currentStep >= 4 && currentStep != 6
                                      ? const NeverScrollableScrollPhysics()
                                      : const AlwaysScrollableScrollPhysics(),
                                  elevation: 10,
                                  type: StepperType.horizontal,
                                  currentStep: currentStep,
                                  onStepCancel: () => currentStep == 0
                                      ? null
                                      : setState(() {
                                          currentStep -= 1;
                                        }),
                                  onStepContinue: () {
                                    bool isLastStep =
                                        (currentStep == getSteps().length - 1);
                                    if (isLastStep) {
                                      // SEND TEST TO API
                                      saveTest(testModel, context);
                                    } else {
                                      // log(answersModel.toJson().toString());
                                      setState(() {
                                        currentStep += 1;
                                      });
                                    }
                                  },
                                  steps: getSteps(),
                                  stepIconBuilder: (index, state) {
                                    Color color = currentStep == index
                                        ? Color.fromARGB(255, 37, 95, 255)
                                        : (currentStep < index
                                            ? Color.fromARGB(144, 0, 0, 0)
                                            : Color.fromARGB(
                                                87, 158, 158, 158));
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
                                            SizedBox(),
                                            SizedBox(),
                                            ElevatedButton(
                                              onPressed: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                if (!testProvider.isLoading) {
                                                  print(testModel);
                                                  print(answersModel.toPrint());
                                                  if (currentStep == 7) {
                                                    onContinueStep7(details);
                                                  } else if (currentStep == 4) {
                                                    onContinueStep4(details);
                                                  } else if (currentStep == 5) {
                                                    onContinueStep5(details);
                                                  } else if (currentStep == 8) {
                                                    onContinueStep8(details);
                                                  } else if (currentStep == 9) {
                                                    onContinueStep9(details);
                                                  } else {
                                                    details.onStepContinue!();
                                                  }
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.yellow,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        deviceWidth * 0.012,
                                                    vertical:
                                                        deviceHeight * 0.01),
                                              ),
                                              child: testProvider.isLoading
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Colors.blue),
                                                      ),
                                                    )
                                                  : Text(
                                                      S.of(context).continueTxt,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: deviceHeight * 0.025),
                                      ],
                                    );
                                  },
                                ),
                              ));
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Visibility(
            //   visible: MediaQuery.of(context).viewInsets.bottom == 0,
            //   child:
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            IconButton(
                              onPressed: () {
                                int currentFocus = focusNodes
                                    .indexWhere((node) => node.hasFocus);
                                if (currentFocus >= 0 &&
                                    currentFocus < focusNodes.length - 1) {
                                  if (currentFocus == 8 ||
                                      currentFocus == 10 ||
                                      currentFocus == 13 ||
                                      currentFocus == 25 ||
                                      currentFocus == 26) {
                                    print('CurrentFocus: $currentFocus');
                                    FocusScope.of(context).unfocus();
                                  } else {
                                    print('CurrentFocus: $currentFocus');
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
                      left: deviceWidth * 0.426,
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
            // ),
          ],
        ),
      ),
    );
    // }
    //   },
    // );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text(''),
        content: SingleChildScrollView(
          child: OrientationStep(
            focusNodes: focusNodes,
            onRefresh: refresh,
            answersModel: answersModel,
          ),
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text(''),
        content: NamingImageStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
          formId: formId,
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text(''),
        content: SimilaritiesStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
          formId: formId,
        ),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: const Text(''),
        content: MemoryInstructionsStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
          formId: formId,
        ),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: const Text(''),
        content: RedrawStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
          formId: formId,
        ),
      ),
      Step(
        state: currentStep > 5 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 5,
        title: const Text(''),
        content: ConstructionDrawStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
          formId: formId,
        ),
      ),
      Step(
        state: currentStep > 6 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 6,
        title: const Text(''),
        content: WordStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
          formId: formId,
        ),
      ),
      Step(
        state: currentStep > 7 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 7,
        title: const Text(''),
        content: TrailStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
          formId: formId,
          isActive: currentStep >= 7,
        ),
      ),
      Step(
        state: currentStep > 8 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 8,
        title: const Text(''),
        content: ExecutiveStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
          formId: formId,
          isActive: currentStep >= 8,
        ),
      ),
      Step(
        state: currentStep > 9 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 9,
        title: const Text(''),
        content: ExecutiveDrawStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
          formId: formId,
          isActive: currentStep >= 9,
        ),
      ),
      Step(
        state: currentStep > 10 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 10,
        title: const Text(''),
        content: MemoryStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
          formId: formId,
        ),
      ),
    ];
  }

  void onContinueStep7(ControlsDetails details) {
    log('STEP WORDS');
    answersModel.verbalWords = [];
    List<String?> verbalWords = [
      answersModel.w1,
      answersModel.w2,
      answersModel.w3,
      answersModel.w4,
      answersModel.w5,
      answersModel.w6,
      answersModel.w7,
      answersModel.w8,
      answersModel.w9,
      answersModel.w10,
      answersModel.w11,
      answersModel.w12,
    ];
    verbalWords.removeWhere((word) => word == null);
    answersModel.verbalWords!.addAll(verbalWords.toList().whereType<String>());
    details.onStepContinue!();
  }

  void onContinueStep4(ControlsDetails details) {
    log('SAVING REDRAW');
    answersModel.isDrawCompleted = true;
    details.onStepContinue!();
  }

  void onContinueStep5(ControlsDetails details) {
    log('SAVING CLOCK DRAW');
    answersModel.isDrawCompleted = true;
    details.onStepContinue!();
  }

  void onContinueStep8(ControlsDetails details) {
    log('SAVING EXECUTIVE DRAW');
    answersModel.isExecLinesDrawCompleted = true;
    details.onStepContinue!();
  }

  void onContinueStep9(ControlsDetails details) {
    log('SAVING EXECUTIVE DRAW');
    answersModel.isExecDrawCompleted = true;
    details.onStepContinue!();
  }

  void saveTest(TestModel testModel, BuildContext context) async {
    final stateManager = TestService();
    final testProvider = Provider.of<TestProvider>(context, listen: false);
    try {
      testProvider.setLoading(true);
      final patient = await DatabaseService().getPatientInfo();
      testModel.patientId = patient.id;

      testProvider.setLoading(false);
    } catch (e) {
      testProvider.setLoading(false);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    try {
      testProvider.setLoading(true);
      // Display the survey dialog
      final testId = await stateManager.saveTestPersonalInfo(
          testModel, answersModel, context);

      Map<String, dynamic> responseMap = json.decode(testId);
      int ti = responseMap['testId'];

      showDialog(
        context: context,
        barrierDismissible: true, // Prevent dismissal by tapping outside
        builder: (BuildContext context) {
          return CustomUserExperience(testId: ti.toString());
        },
      );
      testProvider.setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Test saved successfully'),
        ),
      );
    } catch (e) {
      testProvider.setLoading(false);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } finally {
      // Navigator.pushReplacementNamed(context, 'home');
    }
  }
}

class CustomUserExperience extends StatefulWidget {
  const CustomUserExperience({super.key, required this.testId});

  final String testId;

  @override
  _CustomUserExperienceState createState() => _CustomUserExperienceState();
}

class _CustomUserExperienceState extends State<CustomUserExperience> {
  double mentalDemand = 0;
  double physicalDemand = 0;
  double temporalDemand = 0;
  double performance = 0;
  double effort = 0;
  double frustration = 0;

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    final testProvider = Provider.of<TestProvider>(context);
    print("############## ${widget.testId} ##############");

    return AlertDialog(
      title: Text(localizations.nasaSurveyTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(localizations.nasaSurveyInstruction),
            _buildSlider(
              label: localizations.mentalDemand,
              description: localizations.mentalDemandDescription,
              value: mentalDemand,
              onChanged: (newValue) {
                setState(() {
                  mentalDemand = newValue;
                });
              },
            ),
            _buildSlider(
              label: localizations.physicalDemand,
              description: localizations.physicalDemandDescription,
              value: physicalDemand,
              onChanged: (newValue) {
                setState(() {
                  physicalDemand = newValue;
                });
              },
            ),
            _buildSlider(
              label: localizations.temporalDemand,
              description: localizations.temporalDemandDescription,
              value: temporalDemand,
              onChanged: (newValue) {
                setState(() {
                  temporalDemand = newValue;
                });
              },
            ),
            _buildSlider(
              label: localizations.performance,
              description: localizations.performanceDescription,
              value: performance,
              onChanged: (newValue) {
                setState(() {
                  performance = newValue;
                });
              },
            ),
            _buildSlider(
              label: localizations.effort,
              description: localizations.effortDescription,
              value: effort,
              onChanged: (newValue) {
                setState(() {
                  effort = newValue;
                });
              },
            ),
            _buildSlider(
              label: localizations.frustration,
              description: localizations.frustrationDescription,
              value: frustration,
              onChanged: (newValue) {
                setState(() {
                  frustration = newValue;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(localizations.submit),
          onPressed: () async {
            // Collect the survey data
            testProvider.updateMentalDemand(mentalDemand);
            testProvider.updatePhysicalDemand(physicalDemand);
            testProvider.updateTemporalDemand(temporalDemand);
            testProvider.updatePerformance(performance);
            testProvider.updateEffort(effort);
            testProvider.updateFrustration(frustration);

            final nasa =
                '{"mentalDemand": $mentalDemand, "physicalDemand": $physicalDemand, "temporalDemand": $temporalDemand, "performance": $performance, "effort": $effort, "frustration": $frustration}';
            TestService().saveNasaTlx(int.parse(widget.testId), nasa, context);
            // Submit the survey
            print('Survey Data: $nasa');
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
      ],
    );
  }

  Widget _buildSlider({
    required String label,
    required String description,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    final localizations = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(description),
        Center(
          child: Text(
            _getLabel(value, localizations),
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
          ),
        ),
        Slider(
          value: value,
          min: -10,
          max: 10,
          divisions: 20, // 20 divisions from -10 to 10
          label: label == localizations.performance
              ? _getLabelPerformance(value, localizations)
              : _getLabel(value, localizations),
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            label == localizations.performance
                ? Text(localizations.perfect,
                    style: TextStyle(color: Colors.green))
                : Text(localizations.veryLow,
                    style: TextStyle(color: Colors.red)),
            label == localizations.performance
                ? Text(localizations.failure,
                    style: TextStyle(color: Colors.red))
                : Text(localizations.veryHigh,
                    style: TextStyle(color: Colors.green)),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  String _getLabel(double value, S localizations) {
    if (value == 0) return localizations.neutral;
    if (value > 0 && value <= 3) return localizations.slightlyHigh;
    if (value > 3 && value <= 6) return localizations.high;
    if (value > 6 && value <= 9) return localizations.veryHighLabel;
    if (value > 9) return localizations.extremelyHigh;
    if (value < 0 && value >= -3) return localizations.slightlyLow;
    if (value < -3 && value >= -6) return localizations.low;
    if (value < -6 && value >= -9) return localizations.veryLowLabel;
    if (value < -9) return localizations.extremelyLow;
    return 'unknown';
  }

  String _getLabelPerformance(double value, S localizations) {
    if (value == 0) return localizations.neutral;
    if (value > 0 && value <= 3) return localizations.slightlyFailure;
    if (value > 3 && value <= 6) return localizations.fail;
    if (value > 6 && value <= 9) return localizations.bigFailure;
    if (value > 9) return localizations.allFailed;
    if (value < 0 && value >= -3) return localizations.good;
    if (value < -3 && value >= -6) return localizations.veryGood;
    if (value < -6 && value >= -9) return localizations.almostPerfect;
    if (value < -9) return localizations.completelyPerfect;
    return 'unknown';
  }
}
