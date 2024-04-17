import 'package:flutter/material.dart';
import 'package:frontend_form/providers/patient_provider.dart';
import 'package:frontend_form/services/secure_storage.dart';
import 'package:frontend_form/services/auth_service.dart';
import 'package:frontend_form/widgets/auth_background.dart';
import 'package:frontend_form/widgets/card_container.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final patientProvider = PatientProvider();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final authService = AuthService();
  final storage = SecureStorage();

  LoginScreen({Key? key}) : super(key: key);

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
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
      ),
      body: Center(
        child: AuthBackground(
          child: SafeArea(
            child: Column(children: [
              const SizedBox(height: 150),
              CardContainer(
                  child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () async {
                      String? token = await authService.login(
                          _emailController.text, _passwordController.text);
                      if (token != null) {
                        await storage.storeToken(token);
                        Provider.of<PatientProvider>(context, listen: false)
                            .login(token);
                        FocusScope.of(context).unfocus();
                        Navigator.pushReplacementNamed(context, 'home');
                      } else {
                        print('LOGIN FAILED');
                      }
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
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, 'register'),
                      child: const Text(
                        "I don't have an account",
                        style: TextStyle(color: Colors.blueAccent),
                      ))
                ],
              )),
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
