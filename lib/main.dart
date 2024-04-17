import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_form/providers/providers.dart';
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
        }),
        ChangeNotifierProvider(create: (context) {
          return PatientProvider();
        }),
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
        title: 'CogniSAGE Care',
        theme: myTheme,
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'form': (_) => const FormScreen(),
          'test': (_) => const TestScreen(),
          'instructions': (_) => const TestInstructionsScreen(),
          'personal': (_) => const PersonalInformationScreen(),
          'login': (_) => LoginScreen(),
          'register': (_) => RegisterScreen(),
          'user_info': (_) => UserInfoScreen2(),
        });
  }
}
