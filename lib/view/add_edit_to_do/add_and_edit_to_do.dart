import 'package:flutter/material.dart';
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
              AppTextField(
                labelText: AppStrings.addTime,
                hintText: AppStrings.addTime,
                controller: timeEditingController,
                minimax: 1,
              ),
              /*  Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.black54),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Select Time",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          TimeOfDay? selectTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );
                          if (selectTime != null) {
                            debugPrint("selectTime.format(context)");
                          }
                        },
                        icon: const Icon(Icons.alarm),
                      ),
                    ],
                  ),
                ),
              ),*/
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
                      side: const BorderSide(width: 1, color: AppColors.black54),
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
