import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_jasun/core/constants.dart';
import 'package:project_jasun/screens/auth/login_screen.dart';
import 'package:project_jasun/screens/splash/splash_screen_3.dart';

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          //1. buat image dalam container
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(height:100),
            Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color:const Color.fromARGB(255, 250, 184, 179),
              shape:BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("../assets/images/chibi.png"),
              fit : BoxFit.cover
                  ),
            ),
           ),
                      Text(
              'hawooo gaisss >_<',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 228, 173, 191),
              ),
            ),
                  SizedBox(height: 10,),
                   Text('bertemu lagi dengan pibraaa >u< ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 250, 184, 179)
                    ),
                  ),