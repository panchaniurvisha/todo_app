import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/res/constant/app_colors.dart';

class ToDoTile extends StatelessWidget {
  final String? task;
  final String? description;
  final String? time;
  final String? count;
  final void Function()? onEdit;
  final void Function()? onDelete;
  const ToDoTile(
      {Key? key,
      this.task,
      this.description,
      this.time,
      this.count,
      this.onEdit,
      this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      clipBehavior: Clip.antiAlias,
      height: height / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height / 20),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
                onPressed: (context) => onEdit,
                backgroundColor: AppColors.materialAppColor,
                foregroundColor: AppColors.amberColor,
                icon: Icons.drive_file_rename_outline),
          ],
        ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
                onPressed: (context) => onDelete,
                backgroundColor: AppColors.materialAppColor,
                foregroundColor: AppColors.redColor,
                icon: Icons.delete),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.grayColor,
              ),
              width: width / 6,
              child: Center(
                child: Text(
                  count ?? "",
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
                      task ?? "",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: height / 55,
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
                      time ?? "",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: height / 55,
                      ),
                    ),
                  ],
                ),
                Text(
                  description ?? "",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: height / 50,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              splashRadius: 10,
              onPressed: onEdit,
              icon: const Icon(Icons.drive_file_rename_outline,
                  color: AppColors.amberColor),
            ),
            IconButton(
              splashRadius: 10,
              onPressed: onDelete,
              icon: const Icon(Icons.delete, color: AppColors.redColor),
            ),
          ],
        ),
      ),
    );
  }
}
