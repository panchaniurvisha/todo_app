import 'package:flutter/material.dart';
import 'package:todo_app/res/constant/app_colors.dart';
import 'package:todo_app/res/constant/app_strings.dart';
import 'package:todo_app/view/add_edit_to_do/add_and_edit_to_do.dart';

class ToDoTile extends StatefulWidget {
  final String? task;
  final String? description;
  final String? time;
  final String? count;
  const ToDoTile({Key? key, this.task, this.description, this.time, this.count})
      : super(key: key);

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 70),
      clipBehavior: Clip.antiAlias,
      height: height / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height / 20),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            // spreadRadius: 2,
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.grayColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(height / 15),
                    topLeft: Radius.circular(height / 15))),
            width: width / 6,
            child: Center(
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 45,
                ),
              ),
            ),
          ),
          SizedBox(width: width / 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    AppStrings.title,
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: height / 45,
                    ),
                  ),
                  SizedBox(
                    width: width / 60,
                  ),
                  Container(
                    height: height / 48,
                    width: width / 200,
                    decoration: const BoxDecoration(color: Colors.black26),
                  ),
                  SizedBox(
                    width: width / 60,
                  ),
                  Text(
                    AppStrings.time,
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: height / 45,
                    ),
                  ),
                ],
              ),
              Text(
                AppStrings.description,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 42,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            splashRadius: 1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddAndEditToDo(),
                ),
              );
            },
            icon: const Icon(Icons.drive_file_rename_outline,
                color: AppColors.amberColor),
          ),
          IconButton(
            splashRadius: 1,
            onPressed: () {},
            icon: const Icon(Icons.delete, color: AppColors.redColor),
          ),
        ],
      ),
    );
  }
}
