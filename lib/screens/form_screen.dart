import 'package:flutter/material.dart';
import 'package:frontend_form/models/form_model.dart';
import 'package:frontend_form/providers/form_provider.dart';
import 'package:frontend_form/services/form_service.dart';
import 'package:frontend_form/widgets/draw_board.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  int currentStep = 0;
  static FormModel formModel = FormModel();
  final FormProvider formProvider = FormProvider();

  @override
  void dispose() {
    formModel = new FormModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          title: const Text(
            'SAGE Test Adaptation',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 100),
          child: ChangeNotifierProvider(
            create: (context) =>
                FormProvider(), // Provide an instance of FormProvider
            child: Consumer<FormProvider>(builder: (context, formProvider, _) {
              return Form(
                key: formProvider.formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
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
                      bool isLastStep = (currentStep == getSteps().length - 1);
                      if (isLastStep) {
                        print('Last Step');
                        final stateManager = FormService();
                        stateManager.submitForm(formModel, context);
                      } else {
                        setState(() {
                          currentStep += 1;
                        });
                      }
                    },
                    // onStepTapped: (step) => setState(() {
                    //   currentStep = step;
                    // }),
                    steps: getSteps(),
                    controlsBuilder: (BuildContext context,
                        ControlsDetails controlsDetails) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: controlsDetails.onStepCancel,
                            icon: Icon(Icons.arrow_back),
                            color: Colors.white,
                          ),
                          ElevatedButton(
                            onPressed: controlsDetails.onStepContinue,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              textStyle: const TextStyle(color: Colors.white),
                            ),
                            child: const Text('Next'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            }),
          ),
        )));
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text('Step 1'),
        content: Column(children: [
          const Text(
            'Welcome to the Flutter Form Demo!',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 32),
          const Text(
            'Question 1: What is your name?',
            style: TextStyle(color: Colors.amber),
          ),
          const SizedBox(height: 8),
          TextFormField(
            onChanged: (value) => formModel.answer1 = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Question 2: What is the current date?',
            style: TextStyle(color: Colors.amber),
          ),
          const SizedBox(height: 8),
          TextFormField(
            onChanged: (value) => formModel.answer2 = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 32),
        ]),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text('Step 2'),
        content: Draw(formModel: formModel),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text('Step 3'),
        content: const Center(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Text(
              'Have you finished?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ];
  }
}

class Draw extends StatelessWidget {
  const Draw({
    super.key,
    required this.formModel,
  });

  final FormModel formModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        const Text(
          'Redraw the image below:',
          style: TextStyle(color: Colors.amber),
        ),
        const SizedBox(height: 8),
        Image.asset(
          'assets/images/cube.png',
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 32),
        const SizedBox(
          width: 500,
          height: 600,
          // child: DrawBoard(answersModel:),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
