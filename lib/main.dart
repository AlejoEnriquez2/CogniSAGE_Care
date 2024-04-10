import 'package:flutter/material.dart';
import 'package:frontend_form/screens/home_screen.dart';
import 'package:frontend_form/services/form_service.dart';
import 'package:frontend_form/theme/theme.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
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
        });
  }
}
