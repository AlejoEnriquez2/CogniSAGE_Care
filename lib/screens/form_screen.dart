import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_form/models/form_model.dart';
import 'package:frontend_form/providers/form_provider.dart';
import 'package:frontend_form/services/form_service.dart';
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
          child: DrawBoard(),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class DrawBoard extends StatefulWidget {
  const DrawBoard({Key? key}) : super(key: key);

  @override
  _DrawBoardState createState() => _DrawBoardState();
}

class _DrawBoardState extends State<DrawBoard> {
  List<Offset> _points = <Offset>[];
  bool _isLocked = false;

  void _undoLastLine() {
    if (!_isLocked && _points.isNotEmpty) {
      setState(() {
        _points.removeLast();
        int lastIndex = _points.lastIndexOf(Offset.zero);

        if (lastIndex != -1) {
          _points.removeRange(lastIndex, _points.length);
        } else {
          _points.clear();
        }
        _points.add(Offset.zero);
        print('Removed last line');
      });
    }
  }

  void _clearBoard() {
    if (!_isLocked) {
      setState(() {
        _points.clear();
        print('Cleared board');
      });
    }
  }

  void _saveDraw() async {
    // Create a new image recorder
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);

    // Paint the draw on the canvas
    print("Points length: $_points");
    canvas.drawColor(
      Colors.white,
      BlendMode.color,
    );
    _BoardPainter(points: _points).paint(canvas, Size(500, 500));
    print("Points length now: $_points");
    // End recording and obtain the image
    ui.Picture picture = recorder.endRecording();
    ui.Image image = await picture.toImage(500, 500);

    // Convert the image to bytes
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List bytes = byteData!.buffer.asUint8List();

    // Save the image to file
    String imageName = DateTime.now().toString();
    final result = await ImageGallerySaver.saveImage(bytes, name: imageName);

    if (result['isSuccess']) {
      print('Draw saved successfully' + result.toString());
    } else {
      print('Failed to save draw');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        if (!_isLocked) {
          setState(() {
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            Offset localPosition =
                renderBox.globalToLocal(details.globalPosition);
            if (localPosition.dx >= 0 &&
                localPosition.dx <= renderBox.size.width &&
                localPosition.dy >= 0 &&
                localPosition.dy <= renderBox.size.height - 75) {
              _points = List.from(_points)..add(localPosition);
            }
          });
        }
      },
      onPanEnd: (DragEndDetails details) {
        if (!_isLocked) {
          setState(() {
            _points.add(Offset.zero);
          });
        }
      },
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 500,
            width: 500,
            child: CustomPaint(
              painter: _BoardPainter(points: _points),
            ),
          ),
          Container(
            height: 75,
            width: 500,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _undoLastLine,
                  icon: const Icon(Icons.undo),
                ),
                IconButton(
                  onPressed: _clearBoard,
                  icon: SvgPicture.asset(
                    'assets/icons/eraser-solid.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _saveDraw();
                    });
                  },
                  icon: const Icon(Icons.save),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BoardPainter extends CustomPainter {
  final List<Offset> points;

  _BoardPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
