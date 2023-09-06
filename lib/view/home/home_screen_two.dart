import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/view/add_edit_to_do/add_and_edit_two_screen.dart';

import '../../res/constant/app_constant.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home Screen",
          ),
        ),
        body: AppConstant.toDoModelList.isEmpty
            ? const Center(
                child: Text(
                  "No Data Found",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.separated(
                itemCount: AppConstant.toDoModelList.length,
                padding: const EdgeInsets.all(15),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: CupertinoColors.inactiveGray,
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title: ${AppConstant.toDoModelList[index].title}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                "SubTitle: ${AppConstant.toDoModelList[index].content}"),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            AppConstant.toDoModelList.removeAt(index);
                          });
                        },
                        color: Colors.red,
                        icon: const Icon(CupertinoIcons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddAndEditTwoScreen(index: index),
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        },
                        color: Colors.blue,
                        icon: const Icon(CupertinoIcons.pen),
                      ),
                    ],
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddAndEditTwoScreen(),
              ),
            ).then((value) {
              setState(() {});
            });
          },
          icon: const Icon(Icons.add),
          label: const Text('Add To-do'),
        ),
      ),
    );
  }
}
