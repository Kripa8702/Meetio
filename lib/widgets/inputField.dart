import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:meetio/utils/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class InputField extends StatefulWidget {
  TextEditingController controller;
  String fieldType;
  bool? isObscure = false;
  bool? isDOB = false;
  bool? isAge = false;

  InputField(
      {Key? key,
      required this.controller,
      required this.fieldType,
      this.isObscure,
      this.isDOB,
      this.isAge,
      })
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final DateRangePickerController _controller = DateRangePickerController();
  String _date = DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();

  datePicked(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      setState(() {
        _date = DateFormat('dd, MMMM yyyy').format(args.value).toString();
        print(_date);
        print(args.value);
        widget.controller.text = _date;
      });
    });
    calculateAge(args.value);
  }

  calculateAge(DateTime birthday){
    var age = DateTime.now().year - birthday.year;
    print(age);
    print(widget.isAge??false);
    if(widget.isAge??false){
      setState(() {
        widget.controller.text = age.toString();
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 3.h, left: 5.w, bottom: 1.h),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.fieldType,
              style: TextStyle(
                fontSize: 14.sp,
                color: black,
                fontWeight: FontWeight.w500
              ),
            )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          child: TextFormField(
            textCapitalization: TextCapitalization.words,
            controller: widget.controller,
            cursorColor: darkBlue2,
            obscureText: widget.isObscure ?? false,
            readOnly: (widget.isDOB??false) ? true : false,
            onTap: (widget.isDOB??false) ?
            () => showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    content: Container(
                      height: 50.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: SfDateRangePicker(
                        controller: _controller,
                        selectionMode: DateRangePickerSelectionMode.single,
                        initialSelectedDate: DateTime.now(),
                        onSelectionChanged: datePicked,
                        maxDate: DateTime.now(),
                        showActionButtons: true,
                        // onSubmit: datePicked ,
                        onCancel: () {
                          Navigator.pop(context);
                        },
                        onSubmit: (value) {
                          Navigator.pop(context);
                        },
                        selectionColor: darkBlue2,
                        todayHighlightColor: darkBlue2,
                        selectionTextStyle: TextStyle(
                          fontSize: 12.sp,
                          color: white
                        ),
                        headerStyle: DateRangePickerHeaderStyle(
                          textStyle: TextStyle(
                            color: darkBlue2,
                            fontWeight: FontWeight.w500
                          )
                        ),
                      )
                    )
                  );
                }
            )
            :
            () {},
            // onChanged: (_) => setState(() {}),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This is a required field';
              } else if ((widget.isObscure ?? false) && value.length < 10) {
              return 'Password is too short';
 }
              return null;
            },
            style: TextStyle(
              fontSize: 14.sp,
              color: darkBlue2,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: grey.withOpacity(0.7),
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.2.h),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: grey.withOpacity(0.7),
                ), // BorderSide
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: grey.withOpacity(0.7),
                ), // BorderSide
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: grey.withOpacity(0.7),
                ), // BorderSide
              ),
              // OutlineInputBorder
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 2.0,
                  color: darkBlue2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
