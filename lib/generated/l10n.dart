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

  /// `The SAGE test, or Self-Administered Gerocognitive Exam, is a brief self-assessment tool designed to detect early signs of cognitive impairment. Developed by researchers at the Ohio State University Wexner Medical Center, the test aims to identify changes in cognitive functions that are subtle and might not be immediately apparent, serving as a preliminary screen for conditions like Alzheimer's disease, other dementias, and various neurological problems.The test encompasses a variety of questions and tasks that assess different aspects of cognition, including memory, problem-solving abilities, language, and other key functions.`
  String get sageTestDescription {
    return Intl.message(
      'The SAGE test, or Self-Administered Gerocognitive Exam, is a brief self-assessment tool designed to detect early signs of cognitive impairment. Developed by researchers at the Ohio State University Wexner Medical Center, the test aims to identify changes in cognitive functions that are subtle and might not be immediately apparent, serving as a preliminary screen for conditions like Alzheimer\'s disease, other dementias, and various neurological problems.The test encompasses a variety of questions and tasks that assess different aspects of cognition, including memory, problem-solving abilities, language, and other key functions.',
      name: 'sageTestDescription',
      desc: 'Description of what the SAGE test is.',
      args: [],
    );
  }

  /// `It is designed to be taken on paper, but this is a digitized adaptation of it, and can be completed in approximately 15 minutes. After completion, the system will grade and provide feedback and recommendations about cognitive health.`
  String get sageTestInstructions {
    return Intl.message(
      'It is designed to be taken on paper, but this is a digitized adaptation of it, and can be completed in approximately 15 minutes. After completion, the system will grade and provide feedback and recommendations about cognitive health.',
      name: 'sageTestInstructions',
      desc: 'Instructions about the SAGE test.',
      args: [],
    );
  }

  /// `You will have many screens in which you have to write or draw your answers.`
  String get screensInstructions {
    return Intl.message(
      'You will have many screens in which you have to write or draw your answers.',
      name: 'screensInstructions',
      desc: 'Instructions about the SAGE test.',
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

  /// `Please enter your ethnical background`
  String get pleaseEnterYourEthnicalBackground {
    return Intl.message(
      'Please enter your ethnical background',
      name: 'pleaseEnterYourEthnicalBackground',
      desc: 'Prompt asking for the user\'s ethnical background.',
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

  /// `The user name is:`
  String get userNameIs {
    return Intl.message(
      'The user name is:',
      name: 'userNameIs',
      desc: 'Prefix for displaying the user name.',
      args: [],
    );
  }

  /// `The last grade is:`
  String get lastGradeIs {
    return Intl.message(
      'The last grade is:',
      name: 'lastGradeIs',
      desc: 'Prefix for displaying the last grade achieved in school.',
      args: [],
    );
  }

  /// `The game you have played the most is`
  String get mostPlayedGame {
    return Intl.message(
      'The game you have played the most is',
      name: 'mostPlayedGame',
      desc: 'Prefix for displaying the most played game.',
      args: [],
    );
  }

  /// `Go see a doctor as soon as possible`
  String get seeDoctor {
    return Intl.message(
      'Go see a doctor as soon as possible',
      name: 'seeDoctor',
      desc: 'Urgent recommendation to seek medical advice.',
      args: [],
    );
  }

  /// `Please enter your username`
  String get enterUsername {
    return Intl.message(
      'Please enter your username',
      name: 'enterUsername',
      desc: 'Prompt to enter the username.',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: 'Prompt to enter the password.',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: 'Button text for logging out of the application.',
      args: [],
    );
  }

  /// `What is today's date?`
  String get whatsTodaysDate {
    return Intl.message(
      'What is today\'s date?',
      name: 'whatsTodaysDate',
      desc: 'Question asking for the current date.',
      args: [],
    );
  }

  /// `In numbers (from memory - no cheating!)`
  String get inNumbersFromMemory {
    return Intl.message(
      'In numbers (from memory - no cheating!)',
      name: 'inNumbersFromMemory',
      desc: 'Prompt to answer from memory without help.',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: 'Label for the month part of a date.',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: 'Label for the day part of a date.',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: 'Label for the year part of a date.',
      args: [],
    );
  }

  /// `Name the following pictures`
  String get nameTheFollowingPictures {
    return Intl.message(
      'Name the following pictures',
      name: 'nameTheFollowingPictures',
      desc: 'Instruction to name various pictures shown.',
      args: [],
    );
  }

  /// `don't worry about spelling - just do your best!`
  String get dontWorryAboutSpelling {
    return Intl.message(
      'don\'t worry about spelling - just do your best!',
      name: 'dontWorryAboutSpelling',
      desc: 'Encouragement to focus on attempting rather than accuracy.',
      args: [],
    );
  }

  /// `Answer these questions:`
  String get answerTheseQuestions {
    return Intl.message(
      'Answer these questions:',
      name: 'answerTheseQuestions',
      desc: 'Lead-in to a list of questions.',
      args: [],
    );
  }

  /// `How are a watch and a ruler similar? They both are... what?`
  String get howAreWatchAndRulerSimilar {
    return Intl.message(
      'How are a watch and a ruler similar? They both are... what?',
      name: 'howAreWatchAndRulerSimilar',
      desc: 'Question asking for similarities between a watch and a ruler.',
      args: [],
    );
  }

  /// `Write down how they are alike.`
  String get writeDownHowTheyAreAlike {
    return Intl.message(
      'Write down how they are alike.',
      name: 'writeDownHowTheyAreAlike',
      desc: 'Instruction to document similarities.',
      args: [],
    );
  }

  /// `They both are...`
  String get theyBothAre {
    return Intl.message(
      'They both are...',
      name: 'theyBothAre',
      desc: 'Starter phrase for listing similarities.',
      args: [],
    );
  }

  /// `How many 5 cents are in 60 cents?`
  String get howManyNickelsInSixtyCents {
    return Intl.message(
      'How many 5 cents are in 60 cents?',
      name: 'howManyNickelsInSixtyCents',
      desc: 'Math question involving currency.',
      args: [],
    );
  }

  /// `You are buying $13.45 of groceries. How much change would you receive back from a $20 bill?`
  String get changeFromTwentyDollarBill {
    return Intl.message(
      'You are buying \$13.45 of groceries. How much change would you receive back from a \$20 bill?',
      name: 'changeFromTwentyDollarBill',
      desc: 'Problem solving question involving making change from a purchase.',
      args: [],
    );
  }

  /// `Memory Test`
  String get memoryTest {
    return Intl.message(
      'Memory Test',
      name: 'memoryTest',
      desc: 'Title for a memory test section.',
      args: [],
    );
  }

  /// `Memorize this phrase`
  String get memorizeThisPhrase {
    return Intl.message(
      'Memorize this phrase',
      name: 'memorizeThisPhrase',
      desc: 'Instruction to memorize a given phrase.',
      args: [],
    );
  }

  /// `In the final section, you will be asked to write this phrase.`
  String get inTheFinalSection {
    return Intl.message(
      'In the final section, you will be asked to write this phrase.',
      name: 'inTheFinalSection',
      desc:
          'Information about a future test section involving the memorized phrase.',
      args: [],
    );
  }

  /// `I am done`
  String get iAmDone {
    return Intl.message(
      'I am done',
      name: 'iAmDone',
      desc: 'Statement used to indicate completion of a task.',
      args: [],
    );
  }

  /// `DRAW`
  String get draw {
    return Intl.message(
      'DRAW',
      name: 'draw',
      desc: 'Command to draw.',
      args: [],
    );
  }

  /// `Copy/Redraw this image in the space below`
  String get copyRedrawThisImage {
    return Intl.message(
      'Copy/Redraw this image in the space below',
      name: 'copyRedrawThisImage',
      desc: 'Instruction to replicate an image by drawing.',
      args: [],
    );
  }

  /// `Follow the next instructions`
  String get followNextInstructions {
    return Intl.message(
      'Follow the next instructions',
      name: 'followNextInstructions',
      desc: 'Directive to follow forthcoming instructions.',
      args: [],
    );
  }

  /// `1. Draw a large face of a clock and place the numbers`
  String get drawLargeClockFace {
    return Intl.message(
      '1. Draw a large face of a clock and place the numbers',
      name: 'drawLargeClockFace',
      desc: 'Step one in a series of instructions for drawing a clock.',
      args: [],
    );
  }

  /// `2. Position the hands for 5 minutes after 11 o'clock`
  String get positionHandsForTime {
    return Intl.message(
      '2. Position the hands for 5 minutes after 11 o\'clock',
      name: 'positionHandsForTime',
      desc: 'Step two, setting the clock hands to a specific time.',
      args: [],
    );
  }

  /// `3. On your clock, label 'L' for the long hand and 'S' for the shorthand`
  String get labelClockHands {
    return Intl.message(
      '3. On your clock, label \'L\' for the long hand and \'S\' for the shorthand',
      name: 'labelClockHands',
      desc: 'Step three, labeling the hands of the clock.',
      args: [],
    );
  }

  /// `ANIMALS you can think of`
  String get writeTwelveDifferentAnimals {
    return Intl.message(
      'ANIMALS you can think of',
      name: 'writeTwelveDifferentAnimals',
      desc: 'Prompt to list various animals.',
      args: [],
    );
  }

  /// `Connect the dots`
  String get connectTheDots {
    return Intl.message(
      'Connect the dots',
      name: 'connectTheDots',
      desc: 'Instruction to connect dots in a sequence.',
      args: [],
    );
  }

  /// `Draw a line from one circle to another, start from 1 and alternate with numbers and letters as (1 -> A -> 2 -> B -> 3 -> C... and so on)`
  String get drawLineCircleToCircle {
    return Intl.message(
      'Draw a line from one circle to another, start from 1 and alternate with numbers and letters as (1 -> A -> 2 -> B -> 3 -> C... and so on)',
      name: 'drawLineCircleToCircle',
      desc:
          'Detailed instructions on how to connect circles using a pattern of numbers and letters.',
      args: [],
    );
  }

  /// `Solve the following:`
  String get solveFollowing {
    return Intl.message(
      'Solve the following:',
      name: 'solveFollowing',
      desc: 'Lead-in to a problem-solving task.',
      args: [],
    );
  }

  /// `You start with 2 squares and 2 triangles.`
  String get startWithTwoShapes {
    return Intl.message(
      'You start with 2 squares and 2 triangles.',
      name: 'startWithTwoShapes',
      desc:
          'Description of the initial setup for a problem involving geometric shapes.',
      args: [],
    );
  }

  /// `Cross out 4 lines that you would have to move in order to have 4 squares only`
  String get crossOutFourLines {
    return Intl.message(
      'Cross out 4 lines that you would have to move in order to have 4 squares only',
      name: 'crossOutFourLines',
      desc: 'Instruction to modify a drawing to achieve a specified outcome.',
      args: [],
    );
  }

  /// `Draw your answer:`
  String get drawYourAnswer {
    return Intl.message(
      'Draw your answer:',
      name: 'drawYourAnswer',
      desc: 'Prompt to illustrate the solution to the given problem.',
      args: [],
    );
  }

  /// `Considering the 4 lines you took out, draw the final result of 4 squares only`
  String get finalResultFourSquares {
    return Intl.message(
      'Considering the 4 lines you took out, draw the final result of 4 squares only',
      name: 'finalResultFourSquares',
      desc: 'Instruction to show the end result of a geometry puzzle.',
      args: [],
    );
  }

  /// `Have you finished?`
  String get haveYouFinished {
    return Intl.message(
      'Have you finished?',
      name: 'haveYouFinished',
      desc: 'Question to check if the user has completed their tasks.',
      args: [],
    );
  }

  /// `Write twelve different`
  String get writeTuelveDifferent {
    return Intl.message(
      'Write twelve different',
      name: 'writeTuelveDifferent',
      desc: 'General instructions for writing ',
      args: [],
    );
  }

  /// `My information`
  String get myInformation {
    return Intl.message(
      'My information',
      name: 'myInformation',
      desc: 'My information label',
      args: [],
    );
  }

  /// `How are a rose and a tulip similar? Write down how they are alike. They both are… what?`
  String get howAreARoseAndATulipSimilar {
    return Intl.message(
      'How are a rose and a tulip similar? Write down how they are alike. They both are… what?',
      name: 'howAreARoseAndATulipSimilar',
      desc: 'Abstract question on form 4',
      args: [],
    );
  }

  /// `How many quarters (25 cents) are in €6.75?`
  String get question_quarters_in_euros {
    return Intl.message(
      'How many quarters (25 cents) are in €6.75?',
      name: 'question_quarters_in_euros',
      desc: 'Question about converting euros to quarters',
      args: [],
    );
  }

  /// `You are buying €3.05 of groceries. How much change would you receive back from a €5 bill?`
  String get question_groceries_change {
    return Intl.message(
      'You are buying €3.05 of groceries. How much change would you receive back from a €5 bill?',
      name: 'question_groceries_change',
      desc: 'Question about calculating change from a transaction',
      args: [],
    );
  }

  /// `I have finished`
  String get instruction_finish_last_page {
    return Intl.message(
      'I have finished',
      name: 'instruction_finish_last_page',
      desc: 'Instruction for confirming completion on the last page',
      args: [],
    );
  }

  /// `COUNTRIES around the world`
  String get countries {
    return Intl.message(
      'COUNTRIES around the world',
      name: 'countries',
      desc: 'Task to list names of different countries',
      args: [],
    );
  }

  /// `Beginning with 4 triangles`
  String get instruction_start_with_triangles {
    return Intl.message(
      'Beginning with 4 triangles',
      name: 'instruction_start_with_triangles',
      desc: 'Instruction to start with four triangles',
      args: [],
    );
  }

  /// `Cross out 2 lines (mark them). Leaving 3 triangles only`
  String get instruction_cross_out_lines {
    return Intl.message(
      'Cross out 2 lines (mark them). Leaving 3 triangles only',
      name: 'instruction_cross_out_lines',
      desc: 'Instruction to cross out two lines',
      args: [],
    );
  }

  /// `Leaving 3 triangles`
  String get instruction_leave_triangles {
    return Intl.message(
      'Leaving 3 triangles',
      name: 'instruction_leave_triangles',
      desc: 'Instruction to leave three triangles after crossing out lines',
      args: [],
    );
  }

  /// `Draw the result considering that each line must be part of a complete triangle (no extra lines).`
  String get rule_complete_triangle_lines {
    return Intl.message(
      'Draw the result considering that each line must be part of a complete triangle (no extra lines).',
      name: 'rule_complete_triangle_lines',
      desc: 'Rule that each line must complete a triangle',
      args: [],
    );
  }

  /// `Are you done?`
  String get areYouDone {
    return Intl.message(
      'Are you done?',
      name: 'areYouDone',
      desc: 'Final text of form 4',
      args: [],
    );
  }

  /// `2. Position the hands for 10 minutes before 11 o’clock`
  String get positionHandsForTime4 {
    return Intl.message(
      '2. Position the hands for 10 minutes before 11 o’clock',
      name: 'positionHandsForTime4',
      desc:
          'Segundo paso, configurando las agujas del reloj a una hora específica.',
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
