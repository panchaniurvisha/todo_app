import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/res/commen/app_text_field.dart';
import 'package:todo_app/res/constant/app_colors.dart';
import 'package:todo_app/res/constant/app_strings.dart';
import 'package:todo_app/view/home/home_screen.dart';

class AddAndEditToDo extends StatefulWidget {
  const AddAndEditToDo({Key? key}) : super(key: key);

  @override
  State<AddAndEditToDo> createState() => _AddAndEditToDoState();
}

class _AddAndEditToDoState extends State<AddAndEditToDo> {
  TextEditingController taskEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController timeEditingController = TextEditingController();

  SharedPreferences? sharedPreferences;
  void setInstance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  setData() {
    Map<String, dynamic> data = {
      "task": taskEditingController.text,
      "description": descriptionEditingController.text,
      "time": timeEditingController.text,
    };

    sharedPreferences!.setStringList("ToDoData", [jsonEncode(data)]);
    Navigator.pop(context);
  }

  @override
  void initState() {
    setInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppStrings.appTitle),
        ),
        body: Padding(
          padding: EdgeInsets.all(height / 20),
          child: Column(
            children: [
              AppTextField(
                minimax: 1,
                hintText: AppStrings.addTask,
                labelText: AppStrings.addTask,
                controller: taskEditingController,
              ),
              AppTextField(
                minimax: 6,
                labelText: AppStrings.addDescription,
                hintText: AppStrings.addDescription,
                controller: descriptionEditingController,
              ),
              TextField(
                  controller: timeEditingController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.timer),
                    labelText: AppStrings.addTime,
                    hintText: AppStrings.addTime,
                  ),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                    if (pickedTime != null) {
                      debugPrint(pickedTime.format(context));
                    } else {
                      debugPrint("time is not selected");
                    }
                  }),
              SizedBox(
                height: height / 15,
              ),
              SizedBox(
                width: double.infinity,
                height: height / 15,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width / 10),
                      side:
                          const BorderSide(width: 1, color: AppColors.black54),
                    ),
                  ),
                  child: Text(
                    AppStrings.done,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: height / 60,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
