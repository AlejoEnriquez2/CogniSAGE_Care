import 'package:flutter/material.dart';
import 'package:frontend_form/services/secure_storage.dart';

import '../../models/models.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthNavigationArguments args =
        ModalRoute.of(context)!.settings.arguments as AuthNavigationArguments;
    final storage = SecureStorage();

    return FutureBuilder(
      future: storage.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _CustomCircleProgress();
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        } else if (snapshot.data != null) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.pushReplacementNamed(context, args.routeName);
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.pushReplacementNamed(context, 'login');
          });
        }
        return const _CustomCircleProgress();
      },
    );
  }
}

class _CustomCircleProgress extends StatelessWidget {
  const _CustomCircleProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.yellow,
      ),
    );
  }
}
