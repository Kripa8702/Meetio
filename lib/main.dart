import 'package:flutter/material.dart';
import 'package:meetio/screens/homeScreen.dart';
import 'package:meetio/screens/welcomeScreen.dart';
import 'package:meetio/utils/colors.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Meetio',
          theme: ThemeData(
            fontFamily: 'Lato',
            primaryColor: black,
            // scaffoldBackgroundColor: scaffoldBackground,
            // accentColor: Color(0xFFccf869),
          ),
          routes: {
            '/home': (context) => HomeScreen(),
          },
          home: const WelcomeScreen(),
        );
      }
    );
  }
}

