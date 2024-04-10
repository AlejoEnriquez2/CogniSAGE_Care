import 'package:flutter/material.dart';
import 'package:frontend_form/models/patient_model.dart';

class RegistrationFormProvider extends ChangeNotifier {
  Patient patient = Patient(
    name: '',
    email: '',
    password: '',
    status: 'To be evaluated',
    grade: 0,
    description: 'New user',
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
