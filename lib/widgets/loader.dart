import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,child: Center(child: CircularProgressIndicator()));
  }
}