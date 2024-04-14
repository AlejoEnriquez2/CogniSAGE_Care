import 'package:flutter/material.dart';

class TestInstructionsScreen extends StatelessWidget {
  const TestInstructionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 37, 102, 183),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                width: MediaQuery.of(context).size.width - 50,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        const Text(
                          'What is SAGE Test?',
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
                          child: const Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "The SAGE test, or Self-Administered Gerocognitive Exam, is a brief self-assessment tool designed to detect early signs of cognitive impairment. Developed by researchers at the Ohio State University Wexner Medical Center, the test aims to identify changes in cognitive functions that are subtle and might not be immediately apparent, serving as a preliminary screen for conditions like Alzheimer's disease, other dementias, and various neurological problems.The test encompasses a variety of questions and tasks that assess different aspects of cognition, including memory, problem-solving abilities, language, and other key functions.",
                                  style: TextStyle(fontSize: 17),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "It is designed to be taken on paper, but this is a digitized adaptation of it, and can be completed in approximately 15 minutes. After completion, the system will grade and provide feedback and recommendations about cognitive health.",
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: 26),
                              Text(
                                "You will have many screens in which you have to write or draw your answers.",
                                style: TextStyle(fontStyle: FontStyle.italic),
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
                                'Continue',
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
}
