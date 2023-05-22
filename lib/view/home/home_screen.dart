import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/to_do_model.dart';
import 'package:todo_app/res/constant/app_colors.dart';
import 'package:todo_app/res/constant/app_strings.dart';
import 'package:todo_app/view/home/components/to_do_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  SharedPreferences? sharedPreferences;
  List<ToDoModel> toDoModel = [];
  setInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  getData() {
    var data = sharedPreferences!.getStringList("ToDoData");

    for (var mapData in data!) {
      toDoModel.add(toDoModelFromJson(mapData));
    }

    debugPrint(data.toString());
    debugPrint(jsonEncode(toDoModel));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text(AppStrings.appName)),
        body: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ToDoTile(
                description: toDoModel[index].description,
                task: toDoModel[index].task,
                time: toDoModel[index].time,
                count: (index + 1),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: height / 80),
            itemCount: toDoModel.length),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: AppColors.whiteColor,
          currentIndex: selectedIndex,
          onTap: (value) => setState(() {
            selectedIndex = value;
          }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.fact_check_outlined), label: "Todos"),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed")
          ],
        ),
      ),
    );
  }
}
