import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
 
import '../helpers/app_colors.dart';
import '../helpers/app_style.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({super.key, this.controller, this.title,this.validator});
  var controller;
  var validator;
  var title;
  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title ?? "",
              style: AppStyles().mediumSmallText(
                fontWeight: FontWeight.w500,
                color: Color(AppColors.naviBlueColor),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            //    height: 50,
            child: TextFormField(validator: widget.validator,
              controller: widget.controller,
              //  <TextInputFormatter>[
              //   FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
              // ],
              //inputFormatters: [new  WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")),],
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    widget.controller.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
              decoration: InputDecoration(
                  suffixIcon: Container(
                    child: Icon(
                      Icons.calendar_today,
                    ),
                  ), //i
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  isDense: true,
                  labelStyle: AppStyles().verySmallText(),
                  //label: Text(widget.label ?? ""),
                  fillColor: Colors.white,
                  filled: true,
                  focusedErrorBorder: borderRadius(),
                  border: InputBorder.none,
                  errorBorder: borderRadius(),
                  enabledBorder: borderRadius(),
                  focusedBorder: borderRadius(),
                  floatingLabelStyle: AppStyles().mediumText()),
            )),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  borderRadius() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }
}
