import 'package:flutter/material.dart';
import 'package:frontend_form/widgets/auth_background.dart';
import 'package:frontend_form/widgets/card_container.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../services/registration_service.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static Patient patient = Patient();
  final RegistrationFormProvider registrationFormProvider =
      RegistrationFormProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ),
      body: Center(
        child: AuthBackground(
          child: SafeArea(
            child: Column(children: [
              const SizedBox(height: 150),
              ChangeNotifierProvider(
                create: (context) => RegistrationFormProvider(),
                child: Consumer<RegistrationFormProvider>(
                    builder: (context, registrationFormProvider, _) {
                  return Form(
                    key: registrationFormProvider.formKey,
                    child: CardContainer(
                        child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Register Now',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          onChanged: (value) => patient.name = value,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          onChanged: (value) => patient.email = value,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) => patient.password = value,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            final stateManager = RegistrationService();
                            stateManager.submitRegistration(patient, context);
                            Navigator.pushReplacementNamed(context, 'home');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, 'login');
                            },
                            child: const Text(
                              "I have an account",
                              style: TextStyle(color: Colors.blueAccent),
                            ))
                      ],
                    )),
                  );
                }),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 30),
              const SizedBox(height: 50),
            ]),
          ),
        ),
      ),
    );
  }
}
