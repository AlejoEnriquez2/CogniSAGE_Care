import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_form/generated/l10n.dart';

import '../../../models/models.dart';

class NamingImageStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final AnswersModel answersModel;
  final int formId;

  const NamingImageStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.answersModel,
    required this.formId,
  });

  @override
  State<NamingImageStep> createState() => _NamingImageStepState();
}

class _NamingImageStepState extends State<NamingImageStep> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          Text(
                            S.of(context).nameTheFollowingPictures,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(S.of(context).dontWorryAboutSpelling),
                        ],
                      ),
                      const SizedBox(height: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              widget.formId == 1
                                  ? Transform.scale(
                                      scale:
                                          2, // Adjust the scale value as needed
                                      child: Image.asset(
                                          'assets/images/wreath.png'),
                                    )
                                  : Transform.scale(
                                      scale:
                                          2, // Adjust the scale value as needed
                                      child: Image.asset(
                                          'assets/images/rhino.png'),
                                    ),
                              SizedBox(height: 75),
                              TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    widget.answersModel.namingPicture1 = value;
                                  });
                                },
                                focusNode: widget.focusNodes[9],
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(widget.focusNodes[10]);
                                },
                                decoration: const InputDecoration(
                                  labelText: '',
                                  prefixIcon: Icon(Icons.edit),
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ]),
                          ),
                          Container(
                            width: 150,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              widget.formId == 1
                                  ? Transform.scale(
                                      scale:
                                          2, // Adjust the scale value as needed
                                      child: Image.asset(
                                          'assets/images/volcano.png'),
                                    )
                                  : Transform.scale(
                                      scale:
                                          2, // Adjust the scale value as needed
                                      child:
                                          Image.asset('assets/images/harp.png'),
                                    ),
                              SizedBox(height: 75),
                              TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    widget.answersModel.namingPicture2 = value;
                                  });
                                },
                                focusNode: widget.focusNodes[10],
                                onFieldSubmitted: (_) {
                                  print(widget.answersModel.toJson());
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.hide');
                                },
                                decoration: const InputDecoration(
                                  labelText: '',
                                  prefixIcon: Icon(Icons.edit),
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
