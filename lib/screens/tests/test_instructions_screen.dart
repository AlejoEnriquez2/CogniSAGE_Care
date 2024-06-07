import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:provider/provider.dart';

class TestInstructionsScreen extends StatelessWidget {
  const TestInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TestProvider testProvider = Provider.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Consumer<PatientProvider>(
        builder: (context, patientProvider, child) {
      if (!patientProvider.isLoggedIn) {
        Future.microtask(
            () => Navigator.pushReplacementNamed(context, 'login'));
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
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
                Navigator.pushReplacementNamed(context, 'home');
              },
            ),
            actions: [
              IconButton(
                icon: Text(
                  testProvider.test.formId.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (testProvider.test.formId == 1) {
                    testProvider.updateTestForm(4);
                  } else if (testProvider.test.formId == 4) {
                    testProvider.updateTestForm(1);
                  }
                },
              ),
            ],
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Center(
                child: Container(
                  decoration: CustomBoxDecorator(),
                  child: SizedBox(
                    height: deviceHeight * 0.87,
                    width: deviceWidth * 0.95,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: deviceHeight * 0.02,
                            horizontal: deviceWidth * 0.025),
                        child: Column(
                          children: [
                            Text(
                              S.of(context).whatIsSageTest,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: deviceHeight * 0.10,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: deviceHeight * 0.045),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: deviceWidth * 0.04,
                                  vertical: deviceHeight * 0.025),
                              width: deviceWidth * 0.83,
                              height: deviceHeight * 0.37,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(deviceHeight * 0.014),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      S.of(context).sageTestDescription,
                                      style: TextStyle(
                                          fontSize: deviceHeight * 0.0135),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  SizedBox(height: deviceHeight * 0.015),
                                  Text(
                                    S.of(context).sageTestInstructions,
                                    style: TextStyle(
                                        fontSize: deviceHeight * 0.0135),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(height: deviceHeight * 0.024),
                                  Text(
                                    S.of(context).screensInstructions,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: deviceHeight * 0.0135),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: deviceHeight * 0.025),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      'personal',
                                      arguments: testProvider.test.formId,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          deviceHeight * 0.005),
                                    ),
                                  ),
                                  child: Text(
                                    S.of(context).continueTxt,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: deviceHeight * 0.016,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: deviceHeight * 0.14,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: BottomAppBar(
                          height: deviceHeight * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: deviceHeight * 0.01,
                        left: deviceWidth * 0.424,
                        child: Container(
                          width: deviceWidth * 0.15,
                          height: deviceHeight * 0.11,
                          // width: 125,
                          // height: 140,
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
    });
  }

  BoxDecoration CustomBoxDecorator() {
    return BoxDecoration(
      // color: const Color.fromARGB(255, 37, 102, 183),
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 29, 80, 143),
          Color.fromARGB(255, 37, 102, 183),
        ],
      ),
    );
  }
}
