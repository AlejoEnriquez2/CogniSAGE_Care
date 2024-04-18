import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/services/secure_storage.dart';
import 'package:frontend_form/services/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String _baseUrl = 'http://192.168.0.38:3000';
  PatientProvider patientProvider = PatientProvider();
  DatabaseService databaseService = DatabaseService();
  SecureStorage storage = SecureStorage();
  Patient? patient;

  Future<String?> login(String email, String password) async {
    // try {
    var url = Uri.parse('$_baseUrl/auth/login');

    print(url);
    var response =
        await http.post(url, body: {'email': email, 'password': password});

    print(response.body);
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);

      // token = data['access_token'];
      // await storage.storeToken(token);
      // patientProvider.login(token);

      // if (data['access_token'] != null) {
      //   patientProvider.patient = await databaseService.getPatientInfo();
      //   print("FROM THE PATIENT PROVIDER: " + patientProvider.patient.name!);

      // patient = Patient.fromJson(jsonDecode(response.body));
      // patientProvider.setPatient(patient!);
      // print('THE PATIENT IS BEING SAVED ON THE PROVIDER: ${patient!.name}');

      return data['access_token'];
      // } else {
      //   print('IT IS NULL');
      //   return null;
      // }
    } else {
      print('Will print null');
      return null;
    }
    // } catch (e) {
    //   print('Caught error: $e');
    //   return null;
    // }
  }
}
