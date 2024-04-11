import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int currentStep = 0;
  static TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.all(20.0),
                    child: ChangeNotifierProvider(
                      create: (context) => TestProvider(),
                      child: Consumer<TestProvider>(
                          builder: (context, testProvider, _) {
                        return Form(
                            key: testProvider.formKey,
                            child: Container(
                              child: Stepper(
                                physics: NeverScrollableScrollPhysics(),
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
                                  } else {
                                    setState(() {
                                      currentStep += 1;
                                    });
                                  }
                                },
                                steps: getSteps(),
                              ),
                            ));
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
              height: 160,
              child: Stack(
                children: [
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: BottomAppBar(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: MediaQuery.of(context).size.width / 2 - 62.5,
                    child: Container(
                      width: 125,
                      height: 140,
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
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Icon(Icons.person),
        content: const Column(children: [
          Text(''),
        ]),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Icon(Icons.calendar_month),
        content: const Column(children: [
          Text(''),
        ]),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Icon(Icons.mms_outlined),
        content: const Column(children: [
          Text(''),
        ]),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: const Icon(Icons.menu_book_rounded),
        content: const Column(children: [
          Text(''),
        ]),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: const Icon(Icons.calculate_rounded),
        content: const Column(children: [
          Text(''),
        ]),
      ),
      Step(
        state: currentStep > 5 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 5,
        title: const Icon(Icons.psychology_rounded),
        content: const Column(children: [
          Text(''),
        ]),
      ),
      Step(
        state: currentStep > 6 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 6,
        title: const Icon(Icons.api_rounded),
        content: const Column(children: [
          Text(''),
        ]),
      ),
      Step(
        state: currentStep > 7 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 7,
        title: const Icon(Icons.edit_rounded),
        content: const Column(children: [
          Text(''),
        ]),
      ),
      Step(
        state: currentStep > 8 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 9,
        title: const Icon(Icons.golf_course_sharp),
        content: const Column(children: [
          Text(''),
        ]),
      ),
    ];
  }
}
