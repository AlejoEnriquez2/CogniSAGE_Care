import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_form/theme/theme.dart';
import 'package:provider/provider.dart';

import 'package:frontend_form/screens/screens.dart';
import 'package:frontend_form/services/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const AppState());
  });
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return FormService();
        })
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Form',
        theme: myTheme,
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'form': (_) => const FormScreen(),
          'test': (_) => const TestScreen(),
          'instructions': (_) => const TestInstructionsScreen(),
          'personal': (_) => const PersonalInformationScreen(),
          'login': (_) => const LoginScreen(),
          'register': (_) => RegisterScreen(),
        });
  }
}
