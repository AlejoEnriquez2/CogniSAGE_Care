import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:provider/provider.dart';

class TestInstructionsScreen extends StatelessWidget {
  const TestInstructionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Center(
                child: Container(
                  decoration: CustomBoxDecorator(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 150,
                    width: MediaQuery.of(context).size.width - 50,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            Text(
                              S.of(context).whatIsSageTest,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 125,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 60),
                            Container(
                              padding: EdgeInsets.all(25),
                              width: 700,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      S.of(context).whatIsSageTest,
                                      style: const TextStyle(fontSize: 17),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    S.of(context).sageTestDescription,
                                    style: TextStyle(fontSize: 17),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 26),
                                  const Text(
                                    "You will have many screens in which you have to write or draw your answers.",
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      'personal',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    S.of(context).continueTxt,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
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
