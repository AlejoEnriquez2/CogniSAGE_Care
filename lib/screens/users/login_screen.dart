import 'package:flutter/material.dart';
import 'package:frontend_form/generated/l10n.dart';
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
          child: Form(
            key: patientProvider.formKey,
            child: Column(children: [
              const SizedBox(height: 250),
              CardContainer(
                  child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).login,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: S.of(context).username,
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).enterUsername;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: S.of(context).password,
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).enterPassword;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () async {
                      if (patientProvider.formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        await login(patientProvider, context);
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
                    child: Text(
                      S.of(context).login,
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
                      child: Text(
                        S.of(context).iDontHaveAnAccount,
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

  Future<void> login(
      PatientProvider patientProvider, BuildContext context) async {
    try {
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
    } on Exception catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
