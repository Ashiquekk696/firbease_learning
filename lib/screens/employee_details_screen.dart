import 'package:firbease_learning/models/employees_model.dart';
import 'package:firbease_learning/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/app_style.dart'; 

class EmployeeDetailsScreen extends StatefulWidget {
  EmployeeDetailsScreen({super.key, this.employeeData});
  EmployeeSubDataModel? employeeData;
  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          AppBarWidget(label: widget.employeeData?.firstName ?? ""),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                Container(
                  height: 88,
                  width: 88,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.employeeData?.profileImage??""),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.employeeData?.firstName.toString() ?? "",
                      style: AppStyles().mediumText(),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.employeeData?.lastName.toString() ?? "",
                      style: AppStyles().mediumText(),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.employeeData?.mobile.toString() ?? "",
                  style: AppStyles().verySmallText(),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Number",
                          style: AppStyles().mediumSmallText(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.employeeData?.mobile.toString() ?? "",
                          style: AppStyles().verySmallText(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Gender",
                          style: AppStyles().mediumSmallText(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.employeeData?.gender.toString() ?? "",
                          style: AppStyles().verySmallText(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Status",
                          style: AppStyles().mediumSmallText(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.employeeData?.status.toString() ?? "",
                          style: AppStyles().verySmallText(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Number",
                          style: AppStyles().mediumSmallText(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.employeeData?.mobile.toString() ?? "",
                          style: AppStyles().verySmallText(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Gender",
                          style: AppStyles().mediumSmallText(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.employeeData?.gender.toString() ?? "",
                          style: AppStyles().verySmallText(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Status",
                          style: AppStyles().mediumSmallText(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.employeeData?.status.toString() ?? "",
                          style: AppStyles().verySmallText(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
