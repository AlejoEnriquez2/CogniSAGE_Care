import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/models/models.dart';

class MedicalStep extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final VoidCallback onRefresh;
  final TestModel testModel;

  const MedicalStep({
    super.key,
    required this.focusNodes,
    required this.onRefresh,
    required this.testModel,
  });

  void refreshMainScreen() {
    onRefresh();
  }

  @override
  State<MedicalStep> createState() => _MedicalStepState();
}

class _MedicalStepState extends State<MedicalStep> {
  final TestProvider testProvider = TestProvider();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: deviceHeight * 0.03,
        vertical: deviceWidth * 0.01,
      ),
      child: Column(
        children: [
          Container(
            height: deviceHeight * 0.65,
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
                    SizedBox(height: deviceHeight * 0.02),
                    Text(
                      S.of(context).doYouHaveBalanceProblems,
                      style: TextStyle(fontSize: deviceHeight * 0.020),
                    ),
                    SizedBox(height: deviceHeight * 0.020),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(50),
                          color: widget.testModel.patientBalance != null &&
                                  widget.testModel.patientBalance?[0] == 'y'
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
                                      widget.testModel.patientBalance = 'yes';
                                      testProvider.updateBalanceProblems('yes');
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
                          visible: widget.testModel.patientBalance != null &&
                              widget.testModel.patientBalance?[0] == 'y',
                          child: SizedBox(
                            width: deviceWidth * 0.25,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  widget.testModel.patientBalance =
                                      'yes, $value';
                                  widget.onRefresh();
                                });
                              },
                              focusNode: widget.focusNodes[4],
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(
                                  widget.focusNodes[5],
                                );
                              },
                              decoration: InputDecoration(
                                labelText: S.of(context).doYouKnowWhy,
                                labelStyle: TextStyle(
                                  fontSize: deviceHeight * 0.015,
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
                          isSelected: widget.testModel.patientBalance == 'no',
                          onTap: () {
                            setState(() {
                              widget.testModel.patientBalance = 'no';
                              testProvider.updateBalanceProblems('no');
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.04),
                    Text(
                      S.of(context).haveYouHadAMajorStroke,
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
                              widget.testModel.patientMajorStroke == true,
                          onTap: () {
                            setState(() {
                              widget.testModel.patientMajorStroke = true;
                              testProvider.updateMajorStroke(true);
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
                              widget.testModel.patientMajorStroke == false,
                          onTap: () {
                            setState(() {
                              widget.testModel.patientMajorStroke = false;
                              testProvider.updateMajorStroke(false);
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                    Text(
                      S.of(context).haveYouHadAMinorStroke,
                      style: TextStyle(fontSize: deviceHeight * 0.02),
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
                              widget.testModel.patientMinorStroke == true,
                          onTap: () {
                            setState(() {
                              widget.testModel.patientMinorStroke = true;
                              testProvider.updateMinorStroke(true);
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
                              widget.testModel.patientMinorStroke == false,
                          onTap: () {
                            setState(() {
                              widget.testModel.patientMinorStroke = false;
                              testProvider.updateMinorStroke(false);
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
