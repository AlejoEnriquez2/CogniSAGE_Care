import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    TestModel testModel =
        ModalRoute.of(context)!.settings.arguments as TestModel;

    // return Consumer<PatientProvider>(
    //     builder: (context, patientProvider, child) {
    // if (!patientProvider.isLoggedIn) {
    //   Future.microtask(
    //       () => Navigator.pushReplacementNamed(context, 'login'));
    //   return const Scaffold(
    //       body: Center(child: CircularProgressIndicator()));
    // } else {
    return Scaffold(
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
                height: MediaQuery.of(context).size.height - 150,
                width: MediaQuery.of(context).size.width - 50,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ChangeNotifierProvider(
                      create: (context) => TestProvider(),
                      child: Consumer<TestProvider>(
                          builder: (context, testProvider, _) {
                        return Form(
                            key: testProvider.formKey,
                            child: Container(
                              child: Stepper(
                                physics: currentStep >= 4
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
                                          : Color.fromARGB(87, 158, 158, 158));
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
                                  return Row(
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
                                      const SizedBox(width: 10),
                                      const SizedBox(width: 10),
                                      ElevatedButton(
                                        onPressed: () {
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
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.yellow,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                        ),
                                        child: const Text(
                                          'Continue',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
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
              height: 160,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: BottomAppBar(
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
                                    currentFocus == 12 ||
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
                    bottom: 20,
                    left: MediaQuery.of(context).size.width / 2 - 62.5,
                    child: Container(
                      width: 115,
                      height: 136,
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
        ),
      ),
      Step(
        state: currentStep > 8 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 8,
        title: const Text(''),
        content: ExecutiveDrawStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
        ),
      ),
      Step(
        state: currentStep > 9 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 9,
        title: const Text(''),
        content: MemoryStep(
          focusNodes: focusNodes,
          onRefresh: refresh,
          answersModel: answersModel,
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
    try {
      final patient = await DatabaseService().getPatientInfo();
      testModel.patientId = patient.id;
    } catch (e) {
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
      await stateManager.saveTestPersonalInfo(testModel, answersModel, context);
      Navigator.pushReplacementNamed(context, 'home');
    } catch (e) {
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
  }
}
