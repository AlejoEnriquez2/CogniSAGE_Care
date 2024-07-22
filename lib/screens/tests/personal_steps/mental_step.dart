import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class MentalStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final TestModel testModel;

  const MentalStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.testModel,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<MentalStep> createState() => _MentalStepState();
}

class _MentalStepState extends State<MentalStep> {
  final TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: deviceHeight * 0.01,
        vertical: deviceWidth * 0.01,
      ),
      child: Column(
        children: [
          Container(
            height: deviceHeight * 0.69,
            width: deviceWidth * 0.9,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 253, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.08),
                child: Column(
                  children: [
                    SizedBox(height: deviceHeight * 0.01),
                    Text(
                      S.of(context).doYouCurrentlyFeelSadOrDepressed,
                      style: TextStyle(fontSize: deviceHeight * 0.020),
                    ),
                    SizedBox(height: deviceHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildIconButton(
                          context,
                          deviceHeight,
                          deviceWidth,
                          icon: Icons.check_rounded,
                          label: S.of(context).yes,
                          isSelected:
                              widget.testModel.patientDepression == 'yes',
                          onTap: () {
                            setState(() {
                              widget.testModel.patientDepression = 'yes';
                              testProvider.updateDepression('yes');
                              FocusScope.of(context).unfocus();
                            });
                          },
                        ),
                        _buildIconButton(
                          context,
                          deviceHeight,
                          deviceWidth,
                          icon: Icons.circle_outlined,
                          label: S.of(context).sometimes,
                          isSelected: widget.testModel.patientDepression ==
                              'occasionally',
                          onTap: () {
                            setState(() {
                              widget.testModel.patientDepression =
                                  'occasionally';
                              testProvider.updateDepression('occasionally');
                              FocusScope.of(context).unfocus();
                            });
                          },
                        ),
                        _buildIconButton(
                          context,
                          deviceHeight,
                          deviceWidth,
                          icon: Icons.close_rounded,
                          label: S.of(context).no,
                          isSelected:
                              widget.testModel.patientDepression == 'no',
                          onTap: () {
                            setState(() {
                              widget.testModel.patientDepression = 'no';
                              testProvider.updateDepression('no');
                              FocusScope.of(context).unfocus();
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.03),
                    Text(
                      S.of(context).haveYouHadAnyChangeInYourPersonality,
                      style: TextStyle(fontSize: deviceHeight * 0.02),
                    ),
                    SizedBox(height: deviceHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(50),
                          color: widget.testModel.patientPersonality != null &&
                                  widget.testModel.patientPersonality?[0] == 'y'
                              ? Colors.green
                              : const Color.fromARGB(255, 204, 204, 204),
                          child: Container(
                            height: deviceHeight * 0.10,
                            width: deviceWidth * 0.13,
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.check_rounded,
                                    size: deviceHeight * 0.06,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.testModel.patientPersonality =
                                          'yes';
                                      testProvider.updatePersonality('yes');
                                      FocusScope.of(context).unfocus();
                                      print('YES!');
                                    });
                                  },
                                ),
                                Text(S.of(context).yes,
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.010))
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: widget.testModel.patientPersonality !=
                                  null &&
                              widget.testModel.patientPersonality?[0] == 'y',
                          child: SizedBox(
                            width: deviceWidth * 0.25,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  widget.testModel.patientPersonality =
                                      'yes, $value';
                                  widget.onRefresh();
                                });
                              },
                              focusNode: widget.focusNodes[5],
                              decoration: InputDecoration(
                                labelText: S.of(context).specifyChanges,
                                labelStyle: TextStyle(
                                  fontSize: deviceHeight * 0.013,
                                ),
                              ),
                              style: TextStyle(fontSize: deviceHeight * 0.015),
                            ),
                          ),
                        ),
                        _buildIconButton(
                          context,
                          deviceHeight,
                          deviceWidth,
                          icon: Icons.close_rounded,
                          label: S.of(context).no,
                          isSelected:
                              widget.testModel.patientPersonality == 'no',
                          onTap: () {
                            setState(() {
                              widget.testModel.patientPersonality = 'no';
                              testProvider.updatePersonality('no');
                              FocusScope.of(context).unfocus();
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.03),
                    Text(
                      S
                          .of(context)
                          .doYouHaveMoreDifficultiesDoingEverydayActivitiesDueToThinkingProblems,
                      style: TextStyle(fontSize: deviceHeight * 0.020),
                    ),
                    SizedBox(height: deviceHeight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildIconButton(
                          context,
                          deviceHeight,
                          deviceWidth,
                          icon: Icons.check_rounded,
                          label: S.of(context).yes,
                          isSelected:
                              widget.testModel.patientDifficulties == true,
                          onTap: () {
                            setState(() {
                              widget.testModel.patientDifficulties = true;
                              testProvider.updateDifficulties(true);
                              FocusScope.of(context).unfocus();
                            });
                          },
                        ),
                        _buildIconButton(
                          context,
                          deviceHeight,
                          deviceWidth,
                          icon: Icons.close_rounded,
                          label: S.of(context).no,
                          isSelected:
                              widget.testModel.patientDifficulties == false,
                          onTap: () {
                            setState(() {
                              widget.testModel.patientDifficulties = false;
                              testProvider.updateDifficulties(false);
                              FocusScope.of(context).unfocus();
                            });
                          },
                        ),
                      ],
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

  Widget _buildIconButton(
      BuildContext context, double deviceHeight, double deviceWidth,
      {required IconData icon,
      required String label,
      required bool isSelected,
      required VoidCallback onTap}) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(50),
      color:
          isSelected ? Colors.green : const Color.fromARGB(255, 204, 204, 204),
      child: Container(
        height: deviceHeight * 0.10,
        width: deviceWidth * 0.13,
        child: Column(
          children: [
            IconButton(
              icon: Icon(
                icon,
                size: deviceHeight * 0.06,
              ),
              onPressed: onTap,
            ),
            Text(
              label,
              style: TextStyle(fontSize: deviceHeight * 0.01),
            ),
          ],
        ),
      ),
    );
  }
}
