import 'package:firbease_learning/helpers/app_colors.dart';
import 'package:flutter/material.dart';

import '../helpers/app_style.dart'; 
class ButtonWidget extends StatefulWidget {
  ButtonWidget({super.key, this.label, @required this.onPressed});
  String? label;
  VoidCallback? onPressed;
  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color(AppColors.realBlueColor)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))))),
          onPressed: widget.onPressed,
          child: Text(widget.label ?? "",
              style: AppStyles().mediumSmallText(
                  color: Colors.white, fontWeight: FontWeight.w400))),
    );
  }
}
