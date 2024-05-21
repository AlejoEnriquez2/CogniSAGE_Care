// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: 'The welcome message displayed on the home screen.',
      args: [],
    );
  }

  /// `TEST`
  String get test {
    return Intl.message(
      'TEST',
      name: 'test',
      desc: 'Label for buttons or actions related to testing features.',
      args: [],
    );
  }

  /// `GAMES`
  String get games {
    return Intl.message(
      'GAMES',
      name: 'games',
      desc: 'Title for the section or page that lists games.',
      args: [],
    );
  }

  /// `USER`
  String get user {
    return Intl.message(
      'USER',
      name: 'user',
      desc: 'Label used for user profile or user-related settings.',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: 'Button text for login action.',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: 'Placeholder text for username field.',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'Placeholder text for password field.',
      args: [],
    );
  }

  /// `I don't have an account`
  String get iDontHaveAnAccount {
    return Intl.message(
      'I don\'t have an account',
      name: 'iDontHaveAnAccount',
      desc: 'Text for users to navigate to registration screen.',
      args: [],
    );
  }

  /// `Invalid credentials`
  String get invalidCredentials {
    return Intl.message(
      'Invalid credentials',
      name: 'invalidCredentials',
      desc: 'Error message displayed when login credentials do not match.',
      args: [],
    );
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: 'Prompt text for user to register.',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: 'Placeholder or label for name field.',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: 'Button text for registration action.',
      args: [],
    );
  }

  /// `I have an account`
  String get iHaveAnAccount {
    return Intl.message(
      'I have an account',
      name: 'iHaveAnAccount',
      desc: 'Prompt text for existing users to navigate to login.',
      args: [],
    );
  }

  /// `What is SAGE Test?`
  String get whatIsSageTest {
    return Intl.message(
      'What is SAGE Test?',
      name: 'whatIsSageTest',
      desc: 'Question about what the SAGE test is.',
      args: [],
    );
  }

  /// `The SAGE test, or Self-Administered Gerocognitive Exam, is a brief self-assessment tool designed to detect early signs of cognitive impairment. Developed by researchers at Ohio State University Wexner Medical Center, the test aims to identify changes in cognitive functions that are subtle and might not be immediately apparent, serving as a preliminary screen for conditions like Alzheimer's disease, other dementias, and various neurological problems.`
  String get sageTestDescription {
    return Intl.message(
      'The SAGE test, or Self-Administered Gerocognitive Exam, is a brief self-assessment tool designed to detect early signs of cognitive impairment. Developed by researchers at Ohio State University Wexner Medical Center, the test aims to identify changes in cognitive functions that are subtle and might not be immediately apparent, serving as a preliminary screen for conditions like Alzheimer\'s disease, other dementias, and various neurological problems.',
      name: 'sageTestDescription',
      desc: 'Description of what the SAGE test is.',
      args: [],
    );
  }

  /// `Continue`
  String get continueTxt {
    return Intl.message(
      'Continue',
      name: 'continueTxt',
      desc: 'Button text to proceed in the application.',
      args: [],
    );
  }

  /// `Tell us about you`
  String get tellUsAboutYou {
    return Intl.message(
      'Tell us about you',
      name: 'tellUsAboutYou',
      desc: 'Heading or prompt asking for user details.',
      args: [],
    );
  }

  /// `What is your name?`
  String get whatIsYourName {
    return Intl.message(
      'What is your name?',
      name: 'whatIsYourName',
      desc: 'Question asking for the user\'s name.',
      args: [],
    );
  }

  /// `What is your birthday?`
  String get whatIsYourBirthday {
    return Intl.message(
      'What is your birthday?',
      name: 'whatIsYourBirthday',
      desc: 'Question asking for the user\'s date of birth.',
      args: [],
    );
  }

  /// `How far did you get in school?`
  String get howFarDidYouGetInSchool {
    return Intl.message(
      'How far did you get in school?',
      name: 'howFarDidYouGetInSchool',
      desc: 'Question asking about the user\'s educational attainment.',
      args: [],
    );
  }

  /// `Studies`
  String get studies {
    return Intl.message(
      'Studies',
      name: 'studies',
      desc: 'Label for the field where the user enters their field of study.',
      args: [],
    );
  }

  /// `I am a:`
  String get iAmA {
    return Intl.message(
      'I am a:',
      name: 'iAmA',
      desc: 'Prompt for the user to select their gender.',
      args: [],
    );
  }

  /// `Man`
  String get man {
    return Intl.message(
      'Man',
      name: 'man',
      desc: 'Option for gender selection.',
      args: [],
    );
  }

  /// `Woman`
  String get woman {
    return Intl.message(
      'Woman',
      name: 'woman',
      desc: 'Option for gender selection.',
      args: [],
    );
  }

  /// `Please enter your studies`
  String get pleaseEnterYourStudies {
    return Intl.message(
      'Please enter your studies',
      name: 'pleaseEnterYourStudies',
      desc: 'Prompt asking for details about the user\'s studies.',
      args: [],
    );
  }

  /// `Please enter your birthday`
  String get pleaseEnterYourBirthday {
    return Intl.message(
      'Please enter your birthday',
      name: 'pleaseEnterYourBirthday',
      desc: 'Prompt asking for the user\'s date of birth.',
      args: [],
    );
  }

  /// `Please enter your name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please enter your name',
      name: 'pleaseEnterYourName',
      desc: 'Prompt asking for the user\'s name.',
      args: [],
    );
  }

  /// `My ethnical background is:`
  String get myEthnicalBackgroundIs {
    return Intl.message(
      'My ethnical background is:',
      name: 'myEthnicalBackgroundIs',
      desc: 'Prompt asking for the user\'s ethnical background.',
      args: [],
    );
  }

  /// `Please enter your race`
  String get pleaseEnterYourRace {
    return Intl.message(
      'Please enter your race',
      name: 'pleaseEnterYourRace',
      desc: 'Prompt asking for the user\'s race.',
      args: [],
    );
  }

  /// `Have you had any problems with memory or thinking?`
  String get haveYouHadAnyProblemsWithMemoryOrThinking {
    return Intl.message(
      'Have you had any problems with memory or thinking?',
      name: 'haveYouHadAnyProblemsWithMemoryOrThinking',
      desc: 'Question regarding cognitive issues.',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: 'Affirmative response option.',
      args: [],
    );
  }

  /// `Sometimes`
  String get sometimes {
    return Intl.message(
      'Sometimes',
      name: 'sometimes',
      desc: 'Intermittent response option.',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: 'Negative response option.',
      args: [],
    );
  }

  /// `Have you had any blood relatives that have had problems with memory or thinking?`
  String get haveYouHadAnyBloodRelativesWithProblems {
    return Intl.message(
      'Have you had any blood relatives that have had problems with memory or thinking?',
      name: 'haveYouHadAnyBloodRelativesWithProblems',
      desc: 'Question regarding family history of cognitive issues.',
      args: [],
    );
  }

  /// `Please complete the form`
  String get pleaseCompleteTheForm {
    return Intl.message(
      'Please complete the form',
      name: 'pleaseCompleteTheForm',
      desc: 'Prompt to complete the form.',
      args: [],
    );
  }

  /// `Do you have balance problems?`
  String get doYouHaveBalanceProblems {
    return Intl.message(
      'Do you have balance problems?',
      name: 'doYouHaveBalanceProblems',
      desc: 'Question about balance issues.',
      args: [],
    );
  }

  /// `Do you know why?`
  String get doYouKnowWhy {
    return Intl.message(
      'Do you know why?',
      name: 'doYouKnowWhy',
      desc: 'Follow-up question about the cause of an issue.',
      args: [],
    );
  }

  /// `Have you had a major stroke?`
  String get haveYouHadAMajorStroke {
    return Intl.message(
      'Have you had a major stroke?',
      name: 'haveYouHadAMajorStroke',
      desc: 'Question about having experienced a major stroke.',
      args: [],
    );
  }

  /// `Have you had a minor stroke?`
  String get haveYouHadAMinorStroke {
    return Intl.message(
      'Have you had a minor stroke?',
      name: 'haveYouHadAMinorStroke',
      desc: 'Question about having experienced a minor stroke.',
      args: [],
    );
  }

  /// `Do you currently feel sad or depressed?`
  String get doYouCurrentlyFeelSadOrDepressed {
    return Intl.message(
      'Do you currently feel sad or depressed?',
      name: 'doYouCurrentlyFeelSadOrDepressed',
      desc: 'Question about current feelings of sadness or depression.',
      args: [],
    );
  }

  /// `Have you had any change in your personality?`
  String get haveYouHadAnyChangeInYourPersonality {
    return Intl.message(
      'Have you had any change in your personality?',
      name: 'haveYouHadAnyChangeInYourPersonality',
      desc: 'Question about changes in personality.',
      args: [],
    );
  }

  /// `Specify changes`
  String get specifyChanges {
    return Intl.message(
      'Specify changes',
      name: 'specifyChanges',
      desc: 'Prompt to specify the changes in detail.',
      args: [],
    );
  }

  /// `Do you have more difficulties doing everyday activities due to thinking problems?`
  String
      get doYouHaveMoreDifficultiesDoingEverydayActivitiesDueToThinkingProblems {
    return Intl.message(
      'Do you have more difficulties doing everyday activities due to thinking problems?',
      name:
          'doYouHaveMoreDifficultiesDoingEverydayActivitiesDueToThinkingProblems',
      desc:
          'Question about difficulties in daily activities due to cognitive issues.',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
