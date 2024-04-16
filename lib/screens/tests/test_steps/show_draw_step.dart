import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/widgets/show_byte_image_widget.dart';

class ShowDrawStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;

  const ShowDrawStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.answersModel,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<ShowDrawStep> createState() => _ShowDrawStepState();
}

class _ShowDrawStepState extends State<ShowDrawStep> {
  final TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
                          children: [
                            Text(
                              'DRAW',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('Copy this image on the space bellow'),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/cube.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 550,
                      width: 450,
                      child: ShowImageWidget(
                        imageBytes: Uint8List.fromList(
                            widget.answersModel.constructionsDraw ?? []),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
