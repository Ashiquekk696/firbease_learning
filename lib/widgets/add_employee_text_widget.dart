import 'package:firbease_learning/helpers/app_colors.dart';
import 'package:firbease_learning/helpers/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddEmployeeTextFieldWidget extends StatefulWidget {
  AddEmployeeTextFieldWidget(
      {super.key,
      this.label,
      this.icon,
      this.minLines,
      this.inputFormatter,
      this.validator,
      this.title,
      this.isEmployeeAddingPage,
      this.inputType,
      this.controller});
  String? label;
  IconData? icon;
  TextInputType? inputType;
  int? minLines;
  String? title;

  bool? isEmployeeAddingPage = false;

  TextEditingController? controller = TextEditingController();
  List<TextInputFormatter>? inputFormatter;
  var validator;
  @override
  State<AddEmployeeTextFieldWidget> createState() =>
      _AddEmployeeTextFieldWidgetState();
}

class _AddEmployeeTextFieldWidgetState
    extends State<AddEmployeeTextFieldWidget> {
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: EdgeInsets.only(left: 25, right: 25),
      child: Column(
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
          TextFormField(
            textAlign: TextAlign.start,
            keyboardType: widget.inputType,
            minLines: widget.minLines ?? 1,
            maxLines: 5,
            focusNode: myFocusNode,
            controller: widget.controller,
            validator: widget.validator,
            inputFormatters: widget.inputFormatter,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    left: 10, top: widget.minLines == 1 ? 1 : 25),
                //  isDense: true,

                labelStyle: AppStyles().verySmallText(),
                label: Text(widget.label ?? ""),
                fillColor: Colors.white,
                filled: true,
                focusedErrorBorder: borderRadius(),
                border: InputBorder.none,
                errorBorder: borderRadius(),
                enabledBorder: borderRadius(),
                focusedBorder: borderRadius(),
                floatingLabelStyle: AppStyles().mediumText()),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  borderRadius() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }
}
