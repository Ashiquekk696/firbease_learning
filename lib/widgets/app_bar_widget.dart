import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_style.dart';

class AppBarWidget extends StatefulWidget {
  AppBarWidget({super.key, required this.label});
  String label;
  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Color(AppColors.lightBlueColor),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined)),
              SizedBox(
                width: 20,
              ),
              Text(
                widget.label,
                style: AppStyles().mediumText(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }
}
