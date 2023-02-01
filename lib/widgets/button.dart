import 'package:flutter/material.dart';
import 'package:meetio/utils/colors.dart';
import 'package:sizer/sizer.dart';

class Button extends StatelessWidget {
  Widget nextScreen;
  String text;
  BuildContext pageContext;

  Button({
    Key? key,
    required this.nextScreen,
    required this.text,
    required this.pageContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (pageContext) => nextScreen),
            );
          },
          child: Container(
              height: 6.h,
              width: 80.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(text,
                  style: TextStyle(
                      fontSize: 16.sp, color: white, fontWeight: FontWeight.bold))),
        ));
  }
}
