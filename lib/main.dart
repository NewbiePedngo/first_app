import 'package:first_app/ApiExampleList.dart';
import 'package:first_app/AssignmentWeek5.dart';
import 'package:first_app/MyprofileCard.dart';
import 'package:first_app/assignment1.dart';
import 'package:first_app/AQI.dart';
import 'package:first_app/bottom_navigator.dart';
import 'package:first_app/counter_fulwidget.dart';
import 'package:first_app/counter_widget.dart';
import 'package:first_app/first_page.dart';
import 'package:first_app/form_example1.dart';
import 'package:first_app/form_registration.dart';
import 'package:first_app/greeting_widget.dart';
import 'package:first_app/second_page.dart';
import 'package:first_app/week3.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:first_app/TrafficLight.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //debugShowCheckedModeBanner: false,
    //  initialRoute: '/',
  //    routes: {
//'/': (context) => const BottomNavigatorExample(),
    //    '/second': (context) => const FirstPage(),
      //  '/third': (context) => const SecondPage(),
//},S
            home:TrafficLightApp(),

      //      home: GreetingWidget(childWidget: Text('Good afternoon')),
    );
}
}
