import 'dart:async';

import 'package:bmi_app/view/Home.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Center(
        child: Container(
          height: height * 0.3,
          width: width * 0.7,
          child: Column(
            children: [
              Text(
                "BMI",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: width * 0.23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Calculator",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          // decoration: BoxDecoration(
          //     image: DecorationImage(image: AssetImage("images/logo1.png"))),
        ),
      ),
    ));
  }
}
