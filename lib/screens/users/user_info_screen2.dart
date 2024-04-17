import 'package:flutter/material.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/services/secure_storage.dart';
import 'package:provider/provider.dart';

class UserInfoScreen2 extends StatelessWidget {
  UserInfoScreen2({Key? key}) : super(key: key);
  final storage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserInfoCustom(),
    );
  }
}

class UserInfoCustom extends StatelessWidget {
  UserInfoCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PatientProvider patientProvider = Provider.of<PatientProvider>(context);
    print(
        'THE VARIABLE isLoggedIn is: ' + patientProvider.isLoogedIn.toString());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'My information',
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
                    child: Column(children: [
                      if (patientProvider.isLoogedIn)
                        Center(child: Text('Is logged in'))
                      else
                        Center(child: Text('Is not logged in')),
                    ]),
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
