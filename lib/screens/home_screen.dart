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

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

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
            height: deviceHeight * 0.85,
            width: deviceWidth * 0.95,
            child: Column(
              children: [
                SizedBox(height: deviceHeight * 0.005),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: deviceHeight * 0.005,
                        horizontal: deviceHeight * 0.005),
                    child: Text(
                      S.of(context).welcome,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: deviceHeight * 0.04,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 30),
                Stack(children: [
                  Center(
                    child: Container(
                      width: deviceWidth * 0.5,
                      height: deviceHeight * 0.62,
                      // color: Colors.white,
                      child: Center(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: deviceWidth * 0.65,
                            width: deviceWidth * 0.5,
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
                    top: deviceHeight * 0.1,
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
                              width: deviceWidth * 0.24,
                              height: deviceHeight * 0.24,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: localeProvider.locale.toString() == 'en'
                                  ? deviceHeight * 0.104
                                  : deviceHeight * 0.108,
                              child: Text(
                                S.of(context).test,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      localeProvider.locale.toString() == 'en'
                                          ? deviceHeight * 0.018
                                          : deviceHeight * 0.0132,
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
                              width: deviceWidth * 0.24,
                              height: deviceHeight * 0.24,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: localeProvider.locale.toString() == 'en'
                                  ? deviceHeight * 0.1057
                                  : deviceHeight * 0.108,
                              child: Text(
                                S.of(context).games,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      localeProvider.locale.toString() == 'en'
                                          ? deviceHeight * 0.015
                                          : deviceHeight * 0.0132,
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
                    top: deviceHeight * 0.1,
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
                              width: deviceWidth * 0.24,
                              height: deviceHeight * 0.24,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: localeProvider.locale.toString() == 'en'
                                  ? deviceHeight * 0.104
                                  : deviceHeight * 0.108,
                              child: Text(
                                S.of(context).user,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      localeProvider.locale.toString() == 'en'
                                          ? deviceHeight * 0.018
                                          : deviceHeight * 0.012,
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
