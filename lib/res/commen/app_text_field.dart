import 'package:flutter/material.dart';
import 'package:todo_app/res/constant/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final int minimax;
  final String hintText;
  final String labelText;

  AppTextField({Key? key, this.controller, required this.minimax, required this.hintText, required this.labelText}) : super(key: key);
  final TextEditingController referralCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return TextField(
      autofocus: true,
      style: TextStyle(
        color: AppColors.lightGray,
        fontWeight: FontWeight.w400,
        fontSize: height / 60,
        fontFamily: "Circular Std",
        fontStyle: FontStyle.normal,
      ),
      decoration: InputDecoration(
          counter: Container(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: width / 140, color: AppColors.grayColor),
            borderRadius: BorderRadius.all(
              Radius.circular(width / 60),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: width / 140, color: AppColors.blueColor),
            borderRadius: BorderRadius.all(
              Radius.circular(width / 60),
            ),
          ),
          labelText: labelText,
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xffFFFFFF)),
    );
  }
}
