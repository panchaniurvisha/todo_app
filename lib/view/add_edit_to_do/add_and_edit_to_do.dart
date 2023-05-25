import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/to_do_model.dart';
import 'package:todo_app/res/commen/app_text_field.dart';
import 'package:todo_app/res/constant/app_colors.dart';
import 'package:todo_app/res/constant/app_strings.dart';

class AddAndEditToDo extends StatefulWidget {
  final ToDoModel? toDoModel;
  final int? index;
  const AddAndEditToDo({Key? key, this.toDoModel, this.index})
      : super(key: key);

  @override
  State<AddAndEditToDo> createState() => _AddAndEditToDoState();
}

class _AddAndEditToDoState extends State<AddAndEditToDo> {
  TextEditingController taskEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController timeEditingController = TextEditingController();

  SharedPreferences? sharedPreferences;
  List<String> toDoList = [];
  setInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  getData() {
    if (sharedPreferences!.containsKey("ToDoData")) {
      toDoList = sharedPreferences!.getStringList("ToDoData")!;
      debugPrint("data is get-------->$toDoList");
      setState(() {});
    } else {
      debugPrint("No Data Found=====>");
    }
  }

  setData() {
    Map<String, dynamic> data = {
      "task": taskEditingController.text,
      "description": descriptionEditingController.text,
      "time": timeEditingController.text,
    };
    if (widget.toDoModel != null) {
      toDoList[widget.index!] = (jsonEncode(data));
    } else {
      toDoList.add(jsonEncode(data));
    }

    sharedPreferences!.setStringList("ToDoData", toDoList);
    debugPrint("data is set :$toDoList");
    Navigator.pop(context);
  }

  @override
  void initState() {
    setInstance();
    if (widget.toDoModel != null) {
      taskEditingController.text = widget.toDoModel!.task!;
      descriptionEditingController.text = widget.toDoModel!.description!;
      timeEditingController.text = widget.toDoModel!.time!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.timer),
                      labelText: AppStrings.addTime,
                      hintText: AppStrings.addTime,
                      counter: Container(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: width / 140, color: AppColors.grayColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(width / 60),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: width / 140, color: AppColors.blueColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(width / 60),
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xffFFFFFF)),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                    if (pickedTime != null) {
                      debugPrint(pickedTime.format(context));
                      timeEditingController.text = pickedTime.format(context);
                      setState(() {});
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
                    setData();
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
