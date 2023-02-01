import 'package:flutter/material.dart';
import 'package:meetio/screens/homeScreen.dart';
import 'package:meetio/utils/colors.dart';
import 'package:meetio/widgets/button.dart';
import 'package:meetio/widgets/inputField.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  List<String> choices = [
    "Programming",
    "Android",
    "Cloud",
    "DevOps",
  ];
  var _selectedIndex = [];

  List<Widget> choiceChips() {
    List<Widget> chips = [];
    for (int i = 0; i < choices.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          label: Text(choices[i]),
          labelStyle: _selectedIndex.contains(i)? TextStyle(
              color: white,
                  fontSize: 12.sp
          ) : TextStyle(
              color: black,
              fontSize: 12.sp

          ),
          backgroundColor: white,
          selected: _selectedIndex.contains(i),
          selectedColor: darkBlue2,
          onSelected: (value) {
            setState(() {
              _selectedIndex.contains(i)
                  ? _selectedIndex.remove(i)
                  : _selectedIndex.add(i);
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  @override
  initState() {
    super.initState();
    // dobController.text = DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();
    dobController.addListener(calculateAge);
  }

  calculateAge(){
    if(dobController.text.isEmpty){
      setState(() {
        ageController.text = "0";
      });
    }
    DateTime birthday =  DateFormat('dd, MMMM yyyy').parse(dobController.text);
    var age = DateTime.now().year - birthday.year;
    print(age);
      setState(() {
        ageController.text = age.toString();
    });
  }

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    dobController.dispose();
    ageController.dispose();
    aadharController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: gradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 3.h, bottom: 2.h),
                child: CircleAvatar(
                  radius: 46,
                  backgroundColor: grey.withOpacity(0.5),
                  child: const Icon(
                    Icons.person_outline,
                    color: black,
                    size: 56,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //Address
                      InputField(controller: addressController,
                          fieldType: "Address",),

                      //DOB
                      InputField(controller: dobController,
                        fieldType: "Date of birth",
                      isDOB: true),

                      //Age
                      InputField(controller: ageController,
                        fieldType: "Age",
                      isAge: true),

                      //Aadhar/PAN
                      InputField(controller: aadharController,
                        fieldType: "AADHAAR/PAN number",),

                      //Area of interest
                      Container(
                          margin: EdgeInsets.only(top: 3.h, left: 5.w, bottom: 1.h),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Area of Interest",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: black,
                                fontWeight: FontWeight.w500
                            ),
                          )),
                      Wrap(
                        spacing: 5.w,
                        direction: Axis.horizontal,
                        children: choiceChips(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 3.h),
                        height: 5.h,
                        width: 100.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: darkBlue2,
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Save",
                            style: TextStyle(
                                fontSize: 14.sp, color: white, fontWeight: FontWeight.bold))),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
