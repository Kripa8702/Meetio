import 'package:flutter/material.dart';
import 'package:meetio/model/meetupModel.dart';
import 'package:meetio/screens/eventDetailsScreen.dart';
import 'package:meetio/utils/colors.dart';
import 'package:sizer/sizer.dart';

class MeetupCard extends StatelessWidget {
  MeetupModel meetupModel;

  MeetupCard({Key? key, required this.meetupModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EventDetailsScreen(meetupModel: meetupModel)),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 5.w),
        margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        height: 17.h,
        decoration: BoxDecoration(
          color: grey.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: 45.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${meetupModel.event} Event",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: darkBlue2),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              size: 12.sp,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              width: 45.w,
                              child: Text(
                                meetupModel.date,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    // fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              size: 12.sp,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              width: 45.w,
                              child: Text(
                                meetupModel.address,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    // fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Image.network(
                    meetupModel.picUrl,
                    fit: BoxFit.cover,
                    height: 17.h,
                    width: 35.w,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: darkBlue2,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
