import 'package:flutter/material.dart';
import 'package:meetio/utils/colors.dart';
import 'package:meetio/utils/constants.dart';
import 'package:meetio/utils/utils.dart';
import 'package:meetio/widgets/inputField.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  login(String enteredUsername, String enteredPassword) async {
    if (enteredUsername == username && enteredPassword == password) {
      setState(() {
        loading = true;
      });
      Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
    } else {
      setState(() {
        loading = false;
      });
      showSnackBar("Something went wrong", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w, bottom: 3.h),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign in to continue",
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: darkBlue2,
                    fontWeight: FontWeight.bold
                  ),
                )),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                // height: 80.h,
                // width: 80.w,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //Username
                      InputField(
                        controller: usernameController,
                        fieldType: 'Username',
                      ),

                      //Password
                      InputField(
                        controller: passwordController,
                        fieldType: 'Password',
                        isObscure: true,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);

                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          print(usernameController.text);
                          login(usernameController.text, passwordController.text);
                        },
                        child: Container(
                          height: 6.h,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 4.h, bottom: 1.h, left: 5.w, right: 5.w),
                          decoration: BoxDecoration(
                              gradient: gradient, borderRadius: BorderRadius.circular(50)),
                          child: loading
                              ? Container(
                            height: 2.2.h,
                            width: 2.2.h,
                            child: const CircularProgressIndicator(
                              color: white,
                              strokeWidth: 3.0,
                            ),
                          )
                              : Text(
                            'Continue',
                            style: TextStyle(color: white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: darkBlue2, fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 40.w,
                      child: Divider(
                        color: black.withOpacity(0.7),
                      )
                  ),
                  Text("   or   ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500

                    ),),
                  Container(
                      width: 40.w,
                      child: Divider(
                        color: black.withOpacity(0.7),
                      )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.h, bottom: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 5.h,
                      child: Image.asset("assets/images/google.png")
                  ),
                  Container(
                    height: 5.h,
                      child: Image.asset("assets/images/facebook.png")
                  ),
                  Container(
                    height: 5.h,
                      child: Image.asset("assets/images/twitter.png")
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
