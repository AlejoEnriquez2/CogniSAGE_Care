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
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.025, vertical: deviceHeight * 0.01),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: deviceHeight * 0.6,
              width: deviceWidth * 0.95,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 253, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: deviceHeight * 0.02),
                      Column(
                        children: [
                          Text(
                            S.of(context).nameTheFollowingPictures,
                            style: TextStyle(
                              fontSize: deviceHeight * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: deviceHeight * 0.01),
                          Text(S.of(context).dontWorryAboutSpelling),
                        ],
                      ),
                      SizedBox(height: deviceHeight * 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: deviceWidth * 0.19,
                            padding: EdgeInsets.symmetric(
                                horizontal: deviceWidth * 0.01,
                                vertical: deviceHeight * 0.01),
                            child: Column(children: [
                              widget.formId == 1
                                  ? Transform.scale(
                                      scale: deviceHeight * 0.12 / 75,
                                      child: Image.asset(
                                          'assets/images/wreath.png'),
                                    )
                                  : Transform.scale(
                                      scale: deviceHeight * 0.12 / 75,
                                      child: Image.asset(
                                          'assets/images/rhino.png'),
                                    ),
                              SizedBox(height: deviceHeight * 0.06),
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
                            width: deviceWidth * 0.19,
                            padding: EdgeInsets.symmetric(
                                horizontal: deviceWidth * 0.01,
                                vertical: deviceHeight * 0.01),
                            child: Column(children: [
                              widget.formId == 1
                                  ? Transform.scale(
                                      scale: deviceHeight * 0.12 / 75,
                                      child: Image.asset(
                                          'assets/images/volcano.png'),
                                    )
                                  : Transform.scale(
                                      scale: deviceHeight * 0.12 / 75,
                                      child:
                                          Image.asset('assets/images/harp.png'),
                                    ),
                              SizedBox(height: deviceHeight * 0.06),
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
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                      SizedBox(),
                    ],
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
