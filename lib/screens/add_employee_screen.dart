import 'dart:io';
 
import 'package:file_picker/file_picker.dart';
import 'package:firbease_learning/bloc/designations_bloc.dart';
import 'package:firbease_learning/events/add_employee_event.dart';
import 'package:firbease_learning/helpers/app_style.dart';
import 'package:firbease_learning/state/designtaions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:intl/intl.dart';

import '../bloc/add_employee_bloc.dart';
import '../events/designation_event.dart';
import '../helpers/app_colors.dart';
import '../models/employees_model.dart';
import '../repositories/add_employee_repository.dart';
import '../repositories/designations_repository.dart';
import '../state/add_employee_state.dart';
import '../widgets/add_employee_text_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/date_picker_widget.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/loader.dart';

class AddEmployeeScreen extends StatefulWidget {
  AddEmployeeScreen({super.key, this.employeeData});
  EmployeeModel? employeeData;
  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  TextEditingController dateController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  String dropdownvalue = 'Item 1';

  var profileImage;
  var selectedResume;
  FilePickerResult? result;
  final ImagePicker picker = ImagePicker();
  var designationId;
  var selectedGender;
  var selectedResumeName;
  final _formKey = GlobalKey<FormState>();
  var genders = [
    'male',
    'female',
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        create: (context) => DesignationsBloc(
            designationsRepository:
                RepositoryProvider.of<DesignationsRepository>(context))
          ..add(DesignationsDataEvent()),
        child: BlocProvider(
          create: (context) => AddEmployeeBloc(
              addEmployeeReposiotry:
                  RepositoryProvider.of<AddEmployeeReposiotry>(context)),
          child: Scaffold(
            body: BlocListener<AddEmployeeBloc, AddEmployeeMainState>(
              listener: (context, state) {
                if (state is AddEmployeeLoadedState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Color(AppColors.naviBlueColor),
                      content: Text("Employee addedd succefully")));
                }
              },
              child: BlocBuilder<AddEmployeeBloc, AddEmployeeMainState>(
                  builder: (context, state) {
                if (state is AddEmployeeLoadingState) {
                  return Loader();
                }
                if (state is AddEmployeeLoadedState) {
                  print("succes");
                }
                if (state is AddEmployeeErrorState) {
                  print("error");
                }
                return Container(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppBarWidget(label: "Add an employee"),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            profileImage != null
                                ? Container(
                                    height: 125,
                                    width: 88,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: FileImage(profileImage),
                                            fit: BoxFit.fill)),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      _showPicker(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black12,
                                      ),
                                      height: 125,
                                      width: 88,
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Icon(
                                              Icons.person,
                                              size: 79,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Positioned(
                                            top: 80,
                                            left: 55,
                                            child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.black12,
                                                    shape: BoxShape.circle),
                                                child: Icon(Icons.edit)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 15,
                            ),
                            AddEmployeeTextFieldWidget(
                              validator: (v) {
                                if (firstNameController.text.isEmpty) {
                                  return "first name required";
                                }
                              },
                              title: "First Name",
                              controller: firstNameController,
                            ),
                            AddEmployeeTextFieldWidget(
                              validator: (v) {
                                if (lastNameController.text.isEmpty) {
                                  return "last name required";
                                }
                              },
                              title: "Last Name",
                              controller: lastNameController,
                            ),

                            AddEmployeeTextFieldWidget(
                              controller: mobileController,
                              validator: (v) {
                                if (mobileController.text.isEmpty) {
                                  return "mobile number required";
                                }
                                if (mobileController.text.length < 10) {
                                  return "min 10 numbers required";
                                }
                              },
                              title: "Mobile Number",
                              inputType: TextInputType.number,
                            ),
                            AddEmployeeTextFieldWidget(
                              // label: "Enter Address",
                              controller: emailController,
                              title: "Email",
                              validator: (v) {
                                if (emailController.text.isEmpty) {
                                  return "Email required";
                                }
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(emailController.text);
                                if (emailValid == false) {
                                  return "Email invalid";
                                }
                              },
                            ),
                            AddEmployeeTextFieldWidget(
                              validator: (v) {
                                if (addressController.text.isEmpty) {
                                  return "Address required";
                                }
                              },
                              // label: "Enter Address",
                              title: "Address", controller: addressController,
                              //controller: dateController,
                              minLines: 5,
                            ),
                            // DatePickerWidget()

                            DatePickerWidget(
                              controller: dateController,
                              title: "Date of birth",
                              validator: (v) {
                                if (dateController.text.isEmpty) {
                                  return "Date of Birth required";
                                }
                              },
                            ),
                            filePicker(),
                            SizedBox(
                              height: 20,
                            ),
                            BlocBuilder<DesignationsBloc,
                                    DesignationsMainState>(
                                builder: (context, state) {
                              if (state is DesignationsLoadingState) {
                                return Loader();
                              }
                              if (state is DesignationsLoadedState) {
                                dropdownvalue =
                                    state.designationsModel?[0].id.toString() ??
                                        "";
                                return DropDownWidget(
                                  title: "Designation",
                                  onChanged: (v) {
                                    designationId = v.toString();
                                    dropdownvalue = v;
                                    setState(() {});
                                  },
                                  items: state.designationsModel?.map((e) {
                                    return DropdownMenuItem<String>(
                                        value: e.id.toString(),
                                        child: Text(e.name.toString()));
                                  }).toList(),
                                  value: designationId,
                                );
                              }
                              return Container();
                            }),

                            DropDownWidget(
                              onChanged: (v) async {
                                print(v);
                                selectedGender = v;
                                setState(() {});
                              },
                              title: "Gender",
                              items: genders.map((e) {
                                return DropdownMenuItem<String>(
                                    value: e.toString(),
                                    child: Text(e.toString()));
                              }).toList(),
                              value: selectedGender,
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            ButtonWidget(
                                label: "Save",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AddEmployeeBloc>(context)
                                        .add(AddEmployeePressedEvent(
                                            //  userName: "hhhh", password: "hhhhh")
                                            // AddEmployeePressedEvent(
                                            context: context,
                                            designationId:
                                                designationId.toString(),
                                            dob: dateController.text ?? "hh",
                                            email: emailController.text ?? "hh",
                                            firstName:
                                                firstNameController.text ??
                                                    "hh",
                                            gender: selectedGender.toString(),
                                            lastName:
                                                lastNameController.text ?? "jj",
                                            mobile: mobileController.text
                                                    .toString() ??
                                                "hh",
                                            presentAddres:
                                                addressController.text ?? "kk",
                                            profilePicture: profileImage ?? "",
                                            resume: selectedResume));
                                    print(dateController.text);
                                  }
                                }),
                            SizedBox(
                              height: 33,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
              }),
            ),
          ),
        ),
      ),
    );
  }

  borderRadius() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }

  _imgFromGallery() async {
    XFile? pickedImages = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImages != null) {
      File file = File(pickedImages.path);
      profileImage = file;
      setState(() {});
    }
  }

  getCameraImage() async {
    XFile? cameraImages = await picker.pickImage(
      imageQuality: 30,
      source: ImageSource.camera,
    );
    print(cameraImages?.length());
    if (cameraImages != null) {
      File file = File(cameraImages.path);
      profileImage = file;
      setState(() {});
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getCameraImage();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  filePicker() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Upload resume",
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
            child: TextFormField(
              readOnly: true,
              onTap: () async {
                result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'pdf', 'doc'],
                  //allowedExtensions: ['jpg', 'pdf', 'doc'],
                );
                selectedResume = File(result?.files.single.path ?? "");
                selectedResumeName = result?.names.first;

                setState(() {});
              },
              decoration: InputDecoration(
                  suffixIcon: Container(
                    child: Icon(
                      Icons.document_scanner_rounded,
                      color: Colors.grey,
                    ),
                  ), //i
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  isDense: true,
                  labelStyle: AppStyles().verySmallText(),
                  hintText: selectedResumeName,
                  fillColor: Colors.white,
                  filled: true,
                  focusedErrorBorder: borderRadius(),
                  border: InputBorder.none,
                  errorBorder: borderRadius(),
                  enabledBorder: borderRadius(),
                  focusedBorder: borderRadius(),
                  floatingLabelStyle: AppStyles().mediumText()),
            )),
      ],
    );
  }
}
