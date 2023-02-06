// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pixbit_test/helpers/shared_preferences.dart';
// import 'package:pixbit_test/repositories/list_contacts_repository.dart';
// import 'package:pixbit_test/repositories/login_repository.dart';
// import 'package:pixbit_test/screens/home_screen.dart';
// import 'package:pixbit_test/screens/login_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     startApp();
//     super.initState();
//   }

//   startApp() async { bool isLogged = await Preferences().getIsLoggedIn();
//     Timer((Duration(seconds: 5)), () {
//  if (isLogged == true) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => RepositoryProvider(
//                   create: (context) => ContactsRepository(),
//                   child: HomeScreen())));
//     } else {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => RepositoryProvider(
//                   create: (context) => LoginRepository(),
//                   child: LoginScreen())));
//     }
//     ;
//     });
   

   
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Center(
//             child: CircularProgressIndicator(),
//           )),
//     );
//   }
//}

