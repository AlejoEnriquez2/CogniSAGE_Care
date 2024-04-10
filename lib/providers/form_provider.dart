import 'package:flutter/material.dart';
import 'package:frontend_form/models/form_model.dart';

class FormProvider extends ChangeNotifier {
  FormModel form = FormModel(
    formImage: '',
    draw: '',
    answer1: '',
    answer2: '',
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
