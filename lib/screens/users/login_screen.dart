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
    //PatientProvider patientProvider = Provider.of<PatientProvider>(context);
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
        body: LoginWidget(
          emailController: _emailController,
          passwordController: _passwordController,
          authService: authService,
          storage: storage,
        ));
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.authService,
    required this.storage,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final AuthService authService;
  final SecureStorage storage;

  @override
  Widget build(BuildContext context) {
    PatientProvider patientProvider = Provider.of<PatientProvider>(context);
    return Center(
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
                    FocusScope.of(context).unfocus();
                    var token = await authService.login(
                        _emailController.text, _passwordController.text);
                    if (token != null) {
                      await storage.storeToken(token);
                      patientProvider.login(token);
                      if (patientProvider.isLoggedIn != false) {
                        FocusScope.of(context).unfocus();
                        Navigator.pushReplacementNamed(context, 'home');
                      } else {
                        print('LOGIN FAILED');
                      }
                    } else {
                      print('TOKEN IS NULL');
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
    );
  }
}
