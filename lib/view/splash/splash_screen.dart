import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/res/constant/app_colors.dart';
import 'package:todo_app/res/constant/app_strings.dart';
import 'package:todo_app/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5), //arguments duration and action
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: height / 8,
              ),
              Stack(
                children: [
                  Container(
                    height: height / 4,
                    width: width / 2,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightWhiteColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 32,
                            color: AppColors.grayColor,
                            offset: Offset(32, 32),
                          )
                        ]),
                  ),
                  Container(
                    height: height / 4,
                    width: width / 2,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightWhiteColor,
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.inner,
                            blurRadius: 32,
                            color: AppColors.whiteColor,
                            offset: Offset(-32, -32),
                          )
                        ]),
                    child: Icon(
                      Icons.download_done_outlined,
                      size: height / 6,
                    ),
                  ),
                ],
              ),
              Text(AppStrings.appLabel,
                  style: TextStyle(
                      fontSize: height / 30, fontWeight: FontWeight.bold)),
              SizedBox(
                height: height / 10,
              ),
              Text(AppStrings.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: height / 10,
                      color: AppColors.lightWhiteColor,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
