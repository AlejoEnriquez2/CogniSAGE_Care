import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../services/services.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseService = Provider.of<DatabaseService>(context);

    return Builder(builder: (BuildContext innerContext) {
      return Consumer<PatientProvider>(
          builder: (context, patientProvider, child) {
        if (!patientProvider.isLoggedIn) {
          Future.microtask(
            () => Navigator.pushReplacementNamed(context, 'login'),
          );
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return FutureBuilder<Patient>(
          future: databaseService.getPatientInfo(),
          builder: (context, AsyncSnapshot<Patient> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        title: Text(
                          S.of(context).myInformation,
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
                      body: Center(
                        child: Text(snapshot.error.toString(),
                            style: TextStyle(color: Colors.white)),
                      )));
            } else {
              print("GETS INSIDE THE ELSE");
              Patient patient = snapshot.data!;
              print(patient.toJson());
              return UserInfoCustom(
                  patient: patient, patientProvider: patientProvider);
            }
          },
        );
        // return Scaffold(body: UserInfoCustom(patientProvider: patientProvider));
      });
    });
  }
}

class UserInfoCustom extends StatelessWidget {
  final PatientProvider patientProvider;
  final Patient patient;
  const UserInfoCustom({
    super.key,
    required this.patientProvider,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          S.of(context).myInformation,
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
                height: deviceHeight * 0.90,
                width: deviceWidth * 0.95,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth * 0.05,
                      vertical: deviceHeight * 0.001),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: deviceHeight * 0.02),
                        Row(
                          children: [
                            Container(
                              width: deviceWidth * 0.19,
                              height: deviceHeight * 0.14,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo1.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: deviceWidth * 0.05),
                            Text(
                              '${S.of(context).welcome} ${patient.name}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: deviceHeight * 0.035,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: deviceHeight * 0.02),
                        Container(
                          // padding: const EdgeInsets.all(25),
                          width: deviceWidth * 0.9,
                          height: deviceHeight * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: deviceWidth * 0.04),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: deviceWidth * 0.2,
                                      height: deviceHeight * 0.15,
                                      child: Icon(
                                        Icons.person,
                                        size: deviceHeight * 0.13,
                                      ),
                                    ),
                                    const SizedBox(width: 0),
                                    Container(
                                      width: deviceWidth * 0.5,
                                      height: deviceHeight * 0.08,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${S.of(context).userNameIs} ${patient.name}',
                                              style: TextStyle(
                                                  fontSize:
                                                      deviceHeight * 0.018),
                                            ),
                                            // Text('')
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: deviceWidth * 0.025),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: deviceWidth * 0.2,
                                      height: deviceHeight * 0.13,
                                      child: Icon(
                                        Icons.checklist_rtl,
                                        size: deviceHeight * 0.13,
                                      ),
                                    ),
                                    Container(
                                      width: deviceWidth * 0.5,
                                      height: deviceHeight * 0.08,
                                      child: Center(
                                        child: Text(
                                          patient.grade == 0
                                              ? "Still haven't done the test"
                                              : "${S.of(context).lastGradeIs} ${patient.grade}",
                                          style: TextStyle(
                                              fontSize: deviceHeight * 0.018),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: deviceWidth * 0.2,
                                      height: deviceHeight * 0.13,
                                      child: Icon(
                                        Icons.emoji_events_rounded,
                                        size: deviceHeight * 0.12,
                                      ),
                                    ),
                                    const SizedBox(width: 0),
                                    Container(
                                      width: deviceWidth * 0.4,
                                      height: deviceHeight * 0.08,
                                      child: Center(
                                        child: Text(
                                          S.of(context).mostPlayedGame,
                                          style: TextStyle(
                                              fontSize: deviceHeight * 0.018),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: deviceWidth * 0.025),
                                  ],
                                ),
                                SizedBox(height: deviceHeight * 0.02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: deviceWidth * 0.2,
                                      height: deviceHeight * 0.13,
                                      child: Icon(
                                        Icons.tips_and_updates_rounded,
                                        size: deviceHeight * 0.12,
                                      ),
                                    ),
                                    const SizedBox(width: 0),
                                    Container(
                                      width: deviceWidth * 0.4,
                                      height: deviceHeight * 0.08,
                                      child: Center(
                                        child: Text(
                                          patient.status.toString(),
                                          style: TextStyle(
                                              fontSize: deviceHeight * 0.018),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: deviceWidth * 0.025),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            ElevatedButton(
                              onPressed: () async {
                                // Navigator.pushReplacementNamed(context, 'home');
                                patientProvider.logout();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                S.of(context).logout,
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
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: SizedBox(
          //     height: deviceHeight * 0.10,
          //     child: const Stack(
          //       children: [
          //         Positioned(
          //           bottom: 0,
          //           left: 0,
          //           right: 0,
          //           child: BottomAppBar(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(),
          //               ],
          //             ),
          //           ),
          //         ),
          // Positioned(
          //   bottom: 20,
          //   left: MediaQuery.of(context).size.width / 2 - 62.5,
          //   child: Container(
          //     width: 125,
          //     height: 140,
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/images/logo1.png'),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
          //   ],
          // ),
          //       ),
          //     ),
        ],
      ),
    );
  }
}
