import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/locale_provider.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/screens/users/user_info_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PatientProvider patientProvider = Provider.of<PatientProvider>(context);
    LocaleProvider localeProvider =
        Provider.of<LocaleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'CogniSAGE Care',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Stack(
            children: [
              Image.asset(
                localeProvider.locale.toString() == 'en'
                    ? 'assets/icons/es.png'
                    : 'assets/icons/en.png',
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Icon(
                  Icons.repeat_sharp,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ],
          ),
          onPressed: () {
            var newLocale = localeProvider.locale.toString() == 'en'
                ? localeProvider.setLocale(Locale('es'))
                : localeProvider.setLocale(Locale('en'));
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: CustomBoxDecorator(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 175,
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      S.of(context).welcome,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    )),
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
                        Navigator.pushReplacementNamed(context, 'instructions');
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
                            Positioned(
                              top: 134, // Adjust the value as needed
                              child: Text(
                                S.of(context).test,
                                style: const TextStyle(
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
                        Navigator.pushReplacementNamed(context, 'all_games');
                      },
                      child: ClipOval(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/button.png',
                              width: 200,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 134,
                              child: Text(
                                S.of(context).games,
                                style: const TextStyle(
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
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => UserInfoScreen()),
                            (Route<dynamic> route) => false);
                        // Navigator.pushReplacementNamed(context, 'user_info');
                      },
                      child: ClipOval(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/button.png',
                              width: 200,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 134,
                              child: Text(
                                S.of(context).user,
                                style: const TextStyle(
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
