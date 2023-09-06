import 'package:flutter/material.dart';
import 'package:todo_app/model/to_do_model_data.dart';
import 'package:todo_app/res/constant/app_constant.dart';

class AddAndEditTwoScreen extends StatefulWidget {
  final int? index;
  const AddAndEditTwoScreen({
    super.key,
    this.index,
  });

  @override
  State<AddAndEditTwoScreen> createState() => _AddAndEditTwoScreenState();
}

class _AddAndEditTwoScreenState extends State<AddAndEditTwoScreen> {
  String time = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  TimeOfDay timeOfDay = TimeOfDay.now();
  Future displayTimePicker(BuildContext context) async {
    var timeData = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );

    if (timeData != null) {
      setState(() {
        // time = "${timeData.hour}:${timeData.minute}";
        time = timeData.format(context);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.index != null) {
      titleController.text = AppConstant.toDoModelList[widget.index!].title!;
      contentController.text =
          AppConstant.toDoModelList[widget.index!].content!;
      time = AppConstant.toDoModelList[widget.index!].time!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    //EdgeInsets devicePadding = MediaQuery.of(context).viewPadding;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.index == null ? "Add To-do" : "Edit To-Do",
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(22),
                      isDense: true,
                      hintText: "Unnati Donda",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    controller: contentController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(22),
                      isDense: true,
                      hintText: "contact",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => displayTimePicker(context),
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54, width: 1.2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(time.isEmpty ? "hh : mm" : time),
                        const SizedBox(width: 8),
                        const Icon(Icons.timer_rounded),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight / 2),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.green),
                        fixedSize: MaterialStatePropertyAll(
                          Size(screenWidth / 2.3, screenHeight / 16),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "Add",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.green),
                        fixedSize: MaterialStatePropertyAll(
                          Size(screenWidth / 2.3, screenHeight / 16),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      onPressed: () {
                        if (widget.index != null) {
                          //? To Edit to-do model in to-doModel list
                          AppConstant.toDoModelList[widget.index!] =
                              ToDoModelData(
                            title: titleController.text,
                            content: contentController.text,
                            time: time,
                          );
                          setState(() {});
                        } else {
                          //add in ToDoModeldata
                          AppConstant.toDoModelList.add(
                            ToDoModelData(
                              title: titleController.text,
                              content: contentController.text,
                              time: time,
                            ),
                          );
                          setState(() {});
                        }
                        Navigator.pop(context);
                      },
                      child: Text(
                          widget.index == null ? "Add To-do" : "Edit To-Do"),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
