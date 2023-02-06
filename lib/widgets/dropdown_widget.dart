import 'package:flutter/material.dart'; 

import '../helpers/app_colors.dart';
import '../helpers/app_style.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget(
      {super.key, this.controller, this.title, this.items, this.value,this.selectedItemBuilder,
      required this.onChanged
      });
  var controller;
  var title;
   final Function(dynamic) onChanged;
  List<DropdownMenuItem<Object>>? items = [];

  List<Widget> Function(BuildContext)? selectedItemBuilder;
  var value;
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

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
          height: 55,
          padding: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(color: Colors.blue)),
          width: MediaQuery.of(context).size.width,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(  disabledHint: Text("hhhhhhhh"),
              hint: Text(
                "Select one",
                style: AppStyles().smallText(color: Colors.grey),
              ),
              isExpanded: true,
              value: widget.value,

              icon: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(AppColors.lightBlueColor)),
                  height: 25,
                  width: 25,
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 25,
                  )),

              // Array list of items
              items: widget.items,selectedItemBuilder: widget.selectedItemBuilder,

              onChanged: (newValue) {
                setState(() {
                  widget.value = newValue!;
                  widget.onChanged(newValue);
                setState(() {
                  
                });
                });
              },
            ),
          ),
        ),
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
