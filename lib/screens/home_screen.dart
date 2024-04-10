import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 47, 95, 226),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 135,
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
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
                const SizedBox(height: 100),
                Stack(children: [
                  Center(
                    child: Container(
                      width: 650,
                      height: 900,
                      // color: Colors.white,
                      child: Center(
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
                  Positioned(
                    top: 140,
                    left: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button logic here
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(75),
                      ),
                      child: Text('TEST'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Positioned(
                      top: 0,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your button logic here
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(75),
                        ),
                        child: Text('GAMES'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(75),
                      ),
                      child: Text('USER'),
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
