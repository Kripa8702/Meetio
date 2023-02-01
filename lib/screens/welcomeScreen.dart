import 'package:flutter/material.dart';
import 'package:meetio/screens/loginScreen.dart';
import 'package:meetio/utils/colors.dart';
import 'package:meetio/widgets/button.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(Duration(milliseconds: 1300), () {
      setState(() {
        opacity = 1.0;
        changeOpacity();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(top: 50.h, left: 10.w, right: 20.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome to Meetio.',
                  style: TextStyle(
                      color: black,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold),
                )),
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 1300),
              curve: Curves.decelerate,
              child: Container(
                  padding: EdgeInsets.only(top: 2.h, left: 10.w, right: 10.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Discover meetups, attend seminars and host your own events.',
                    style: TextStyle(color: black, fontSize: 14.sp),
                  )),
            ),
            SizedBox(
              height: 13.h,
            ),
            Button(
              nextScreen: LoginScreen(),
              text: 'SignUp',
              pageContext: context,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(color: black, fontSize: 12.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
                  child: Container(
                    // padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      ' Log in.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: darkBlue2, fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}

