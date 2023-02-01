import 'package:flutter/material.dart';
import 'package:meetio/model/meetupModel.dart';
import 'package:meetio/screens/homeScreen.dart';
import 'package:meetio/utils/colors.dart';
import 'package:meetio/widgets/button.dart';
import 'package:sizer/sizer.dart';

class EventDetailsScreen extends StatelessWidget {
  MeetupModel meetupModel;
  EventDetailsScreen({Key? key, required this.meetupModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100.h,
            child: Stack(
              children: [
                Image.network(
                  meetupModel.picUrl,
                  fit: BoxFit.cover,
                  height: 43.h,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                Positioned(
                  right: 3.w,
                    top: 3.h,
                    child: Container(
                      height: 5.h,
                      width: 5.h,
                      decoration: BoxDecoration(
                          color: green.withOpacity(0.7),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Icon(
                        Icons.bookmark,
                        color: black,
                      ),
                    )
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 63.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),

                    padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  "EVENT",
                                  style: TextStyle(fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: borderColor
                                  ),
                                ) ,
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  meetupModel.event,
                                  style: TextStyle(fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: black
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,

                                        children: [
                                          Icon(
                                            Icons.location_on_rounded,
                                            size: 12.sp,
                                            color: darkBlue,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 2.w),
                                            width: 47.w,
                                            child: Text(
                                              meetupModel.address,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: darkBlue),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.calendar_month_rounded,
                                            size: 12.sp,
                                            color: darkBlue,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 2.w, right: 2.w),
                                            // width: 40.w,
                                            child: Text(
                                              meetupModel.date,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  // fontWeight: FontWeight.w500,
                                                  color: darkBlue),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 90.w,
                                  height: 5.h,
                                  child: Divider(),
                                ),

                                Text(
                                  "Topic",
                                  style: TextStyle(fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: black
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  meetupModel.topic,
                                  style: TextStyle(fontSize: 12.sp,
                                      // fontWeight: FontWeight.bold,
                                      color: black
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  "Speaker",
                                  style: TextStyle(fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: black
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  meetupModel.speaker,
                                  style: TextStyle(fontSize: 12.sp,
                                      // fontWeight: FontWeight.bold,
                                      color: black
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 90.w,
                                  height: 5.h,
                                  child: Divider(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(),
                                    Text(
                                      "${meetupModel.people} Going",
                                      style: TextStyle(fontSize: 12.sp,
                                          // fontWeight: FontWeight.bold,
                                          color: black
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                        Button(
                          nextScreen: HomeScreen(),
                          pageContext: context,
                          text: "Book now",
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
