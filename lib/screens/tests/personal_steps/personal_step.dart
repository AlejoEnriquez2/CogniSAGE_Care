import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class PersonalStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final TestModel testModel;
  final GlobalKey<FormState> formKey;

  PersonalStep({
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
  State<PersonalStep> createState() => _PersonalStepState();
}

class _PersonalStepState extends State<PersonalStep> {
  final TestProvider testProvider = TestProvider();
  final birthdayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    String oldText = '';
    birthdayController.addListener(() {
      final text = birthdayController.text;
      if (text.length < oldText.length) {
        oldText = text;
        return;
      }
      if (text.length == 2 || text.length == 5) {
        birthdayController.text = text + '/';
        birthdayController.selection = TextSelection.fromPosition(
          TextPosition(offset: birthdayController.text.length),
        );
      }
      oldText = text;
    });
  }

  @override
  void dispose() {
    birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          S.of(context).tellUsAboutYou,
                          style: TextStyle(
                            fontSize: deviceHeight * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.025),
                        Text(
                          S.of(context).whatIsYourName,
                          style: TextStyle(fontSize: deviceHeight * 0.020),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              widget.testModel.patientName = value;
                            });
                          },
                          focusNode: widget.focusNodes[0],
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(widget.focusNodes[1]);
                          },
                          decoration: InputDecoration(
                            labelText: S.of(context).name,
                            prefixIcon: const Icon(Icons.edit_square),
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).pleaseEnterYourName;
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: deviceHeight * 0.015),
                        ),
                        SizedBox(height: deviceHeight * 0.025),
                        Text(
                          S.of(context).whatIsYourBirthday,
                          style: TextStyle(fontSize: deviceHeight * 0.020),
                        ),
                        TextFormField(
                          maxLength: 10,
                          // controller: birthdayController,
                          // keyboardType: TextInputType.datetime,
                          onChanged: (value) {
                            setState(() {
                              widget.testModel.patientBirthday = value;
                            });
                          },
                          focusNode: widget.focusNodes[1],
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(widget.focusNodes[2]);
                          },
                          decoration: const InputDecoration(
                            labelText: 'DD/MM/YYYY',
                            prefixIcon: Icon(Icons.date_range_rounded),
                            counterText: '',
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).pleaseEnterYourBirthday;
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: deviceHeight * 0.015),
                        ),
                        SizedBox(height: deviceHeight * 0.025),
                        Text(
                          S.of(context).howFarDidYouGetInSchool,
                          style: TextStyle(fontSize: deviceHeight * 0.020),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              widget.testModel.patientEducation = value;
                            });
                          },
                          focusNode: widget.focusNodes[2],
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                          },
                          decoration: InputDecoration(
                            labelText: S.of(context).studies,
                            prefixIcon: Icon(Icons.menu_book_outlined),
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).pleaseEnterYourStudies;
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: deviceHeight * 0.015),
                        ),
                        SizedBox(height: deviceHeight * 0.025),
                        Text(
                          S.of(context).iAmA,
                          style: TextStyle(fontSize: deviceHeight * 0.020),
                        ),
                        SizedBox(height: deviceHeight * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(50),
                              color: widget.testModel.patientGender == 'man'
                                  ? Colors.green
                                  : const Color.fromARGB(255, 204, 204, 204),
                              child: Container(
                                height: deviceHeight * 0.1,
                                width: deviceWidth * 0.13,
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.male,
                                        size: deviceHeight * 0.06,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.testModel.patientGender =
                                              'man';
                                          testProvider.updateGender(true);
                                          FocusScope.of(context).unfocus();
                                          print('It is a man');
                                        });
                                      },
                                    ),
                                    Text(S.of(context).man,
                                        style: TextStyle(
                                            fontSize: deviceHeight * 0.010)),
                                  ],
                                ),
                              ),
                            ),
                            Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(50),
                              color: widget.testModel.patientGender == 'woman'
                                  ? Colors.green
                                  : const Color.fromARGB(255, 204, 204, 204),
                              child: Container(
                                height: deviceHeight * 0.1,
                                width: deviceWidth * 0.13,
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.female,
                                        size: deviceHeight * 0.06,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.testModel.patientGender =
                                              'woman';
                                          testProvider.updateGender(false);
                                          FocusScope.of(context).unfocus();
                                          print('It is a woman');
                                        });
                                      },
                                    ),
                                    Text(S.of(context).woman,
                                        style: TextStyle(
                                            fontSize: deviceHeight * 0.010))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: deviceHeight * 0.025),
        ]),
      ),
    );
  }
}
