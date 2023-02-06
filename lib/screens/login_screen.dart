import 'package:firbease_learning/repositories/list_contacts_repository.dart';
import 'package:firbease_learning/screens/home_screen.dart';
import 'package:firbease_learning/widgets/button_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';
import '../events/login_event.dart';
import '../helpers/app_colors.dart';
import '../helpers/app_style.dart';
import '../repositories/login_repository.dart';
import '../state/login_state.dart';
import '../widgets/loader.dart';
import '../widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth? auth = FirebaseAuth.instance;
  User? user;

  @override
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Form(
              key: _formKey,
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 140,
                                ),
                                Text(
                                  "Welcome Back",
                                  style: AppStyles().largeText(),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "Please login to your account",
                                  style: AppStyles().smallText(),
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                // user != null
                                //     ? Text(user?.displayName ?? "")
                                //     : Container()
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              decoration: BoxDecoration(
                                  color: Color(AppColors.lightBlueColor),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(22),
                                      topRight: Radius.circular(22))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 66,
                                  ),
                                  TextFieldWidget(
                                    validator: (value) {
                                      if (value.trim().isEmpty)
                                        return "Username required";

                                      return null;
                                    },
                                    controller: userNameController,
                                    inputFormatter: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[a-zA-Z0-9@&.]")),
                                    ],
                                    label: "Username",
                                    icon: Icons.mail,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  TextFieldWidget(
                                    validator: (v) {
                                      if (v.trim().isEmpty)
                                        return "Password required";
                                      if (passwordController.text.length < 5) {
                                        return "Minimum 5 digits have to be added";
                                      }
                                    },
                                    controller: passwordController,
                                    label: "Password",
                                    icon: Icons.key,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ButtonWidget(
                                    onPressed: () async {
                                      print("object");
                                      //await signIn();
                                      //    user = await signIn();
                                      // User currentUser = await auth.currentUser;
                                      // print(currentUser.displayName);
                                      FirebaseAuth.instance
                                          .authStateChanges()
                                          .listen((User? user) {
                                        if (user == null) {
                                          print(
                                              'User is currently signed out!');
                                        } else {
                                          print(user.email);
                                          print('User is signed in!');
                                          if (user != null) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RepositoryProvider(
                                                          create: (context) =>
                                                              ContactsRepository(),
                                                          child: HomeScreen(),
                                                        )));
                                          }
                                        }
                                      });
                                      print(user?.displayName);
                                      //    setState(() {});
                                    },
                                    label: "Sign in",
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ))
                  // }

                  ),
            );
          }
          return Container();
        });
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userNameController.text.trim(),
        password: passwordController.text.trim());
  }
}

// class LoginWidget extends StatefulWidget {
//   const LoginWidget({super.key});

//   @override
//   State<LoginWidget> createState() => _LoginWidgetState();
// }

// class _LoginWidgetState extends State<LoginWidget> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFieldWidget(
//           controller: emailController,
//           label: "Email",
//         ),
//         TextFieldWidget(
//           label: "Password",
//           controller: passwordController,
//         ),
//         ButtonWidget(onPressed: () {
//           signIn();
//         })
//       ],
//     );
//   }

//   Future signIn() async {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text, password: passwordController.text);
//   }
// }
