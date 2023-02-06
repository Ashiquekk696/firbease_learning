import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../helpers/app_style.dart'; 
class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(
      {super.key,
      this.label,
      @required this.icon,
      this.inputFormatter,
      this.validator,this.isEmployeeAddingPage,
      this.controller});
  String? label;
  IconData? icon;
  bool? isEmployeeAddingPage=false;

  TextEditingController? controller = TextEditingController();
  List<TextInputFormatter>? inputFormatter;
  var validator;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
        //    height: 50,
        child: TextFormField(
      focusNode: myFocusNode,
      controller: widget.controller,
      validator: widget.validator,
      inputFormatters: widget.inputFormatter,
      //  <TextInputFormatter>[
      //   FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
      // ],
      //inputFormatters: [new  WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")),],
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          isDense: true,
          prefixIcon: Icon(
            widget.icon,
            size: 20,
          ),
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
    ));
  }

  borderRadius() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }
}
