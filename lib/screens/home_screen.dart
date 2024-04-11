import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'CogniSAGE Care',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.pushReplacementNamed(context, 'home');
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 37, 102, 183),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 175,
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome %Username!',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                Stack(children: [
                  Center(
                    child: Container(
                      width: 650,
                      height: MediaQuery.of(context).size.height - 500,
                      // color: Colors.white,
                      child: Center(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 500,
                            width: 400,
                            child: Image.asset(
                              'assets/images/logo1.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        print('button Test');
                        Navigator.pushReplacementNamed(context, 'test');
                      },
                      child: ClipOval(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/button.png',
                              width: 200, // Adjust as needed
                              height: 300, // Adjust as needed
                              fit: BoxFit.cover,
                            ),
                            const Positioned(
                              top: 134, // Adjust the value as needed
                              child: Text(
                                'TEST',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        print('button games');
                      },
                      child: ClipOval(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/button.png',
                              width: 200, // Adjust as needed
                              height: 300, // Adjust as needed
                              fit: BoxFit.cover,
                            ),
                            const Positioned(
                              top: 134, // Adjust the value as needed
                              child: Text(
                                'GAMES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        print('button User');
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      child: ClipOval(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/button.png',
                              width: 200, // Adjust as needed
                              height: 300, // Adjust as needed
                              fit: BoxFit.cover,
                            ),
                            const Positioned(
                              top: 134, // Adjust the value as needed
                              child: Text(
                                'USER',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
