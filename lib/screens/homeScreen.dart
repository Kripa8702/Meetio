import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:meetio/screens/QRCodeScannerScreen.dart';
import 'package:meetio/screens/profileScreen.dart';
import 'package:meetio/utils/colors.dart';
import 'package:meetio/utils/constants.dart';
import 'package:meetio/utils/utils.dart';
import 'package:meetio/widgets/meetupCard.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _scanBarcode = 'Unknown';

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
      checkingValue(_scanBarcode);
  }

  checkingValue(String url) {
    if (url != null || url != "") {
      if (url.contains("https") || url.contains("http")) {
        return _launchURL(url);
      } else {
        showSnackBar("Invalid URL", context);
      }
    } else {
      return null;
    }
  }

  _launchURL(String urlQRCode) async {
    String url = urlQRCode;
    Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5],
          colors: [
            green2,
            white,
          ],
        )
      ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: white.withOpacity(0.8),
                          child: const Icon(
                            Icons.person_outline,
                            color: darkBlue2,
                            size: 27,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.w
                      ),
                      Text(
                        username,
                        style: TextStyle(fontSize: 12.sp, color: black),
                      )
                    ],
                  ),
                  Container(
                    height: 46,
                      width: 46,
                    decoration: BoxDecoration(
                        color: white.withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    child: IconButton(
                        onPressed: () => scanQR(),
                        icon: Icon(
                          Icons.qr_code_scanner,
                          size: 23.sp,
                          color: darkBlue2,
                        )),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 5.w, top: 5.h),
                child: Text(
                  "Hello, Kripa!",
                  style: TextStyle(
                      color: black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
            Container(
              alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 5.w, top: 1.h, bottom: 5.h),
                child: Text(
                  "Let's explore what's happening nearby",
                  style: TextStyle(
                      color: black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500
                  ),
                )
            ),

            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: meetupList.length,
                  itemBuilder: (context, index) => MeetupCard(
                    meetupModel: meetupList[index],
                  )
              ),
            )
          ],
        ),
      ),
    ));
  }
}
