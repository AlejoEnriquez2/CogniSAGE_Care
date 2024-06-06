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
                height: MediaQuery.of(context).size.height - 150,
                width: MediaQuery.of(context).size.width - 50,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 125,
                              height: 150,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo1.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Text(
                              '${S.of(context).welcome} ${patient.name}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.all(25),
                          width: 700,
                          height: 750,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 150,
                                      child: const Icon(
                                        Icons.person,
                                        size: 130,
                                      ),
                                    ),
                                    const SizedBox(width: 0),
                                    Container(
                                      width: 300,
                                      height: 150,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${S.of(context).userNameIs} ${patient.name}',
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            Text('')
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 150,
                                      child: const Icon(
                                        Icons.checklist_rtl,
                                        size: 130,
                                      ),
                                    ),
                                    const SizedBox(width: 0),
                                    Container(
                                      width: 300,
                                      height: 150,
                                      child: Center(
                                        child: Text(
                                          patient.grade == 0
                                              ? "Still haven't done the test"
                                              : "${S.of(context).lastGradeIs} ${patient.grade}",
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 150,
                                      child: const Icon(
                                        Icons.emoji_events_rounded,
                                        size: 130,
                                      ),
                                    ),
                                    const SizedBox(width: 0),
                                    Container(
                                      width: 300,
                                      height: 150,
                                      child: Center(
                                        child: Text(
                                          S.of(context).mostPlayedGame,
                                          style: TextStyle(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 150,
                                      child: const Icon(
                                        Icons.tips_and_updates_rounded,
                                        size: 130,
                                      ),
                                    ),
                                    const SizedBox(width: 0),
                                    Container(
                                      width: 300,
                                      height: 150,
                                      child: Center(
                                        child: Text(
                                          patient.status.toString(),
                                          style: const TextStyle(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
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
          const Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 160,
              child: Stack(
                children: [
                  Positioned(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
