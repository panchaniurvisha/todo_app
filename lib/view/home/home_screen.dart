import 'package:flutter/material.dart';
import 'package:todo_app/res/constant/app_colors.dart';
import 'package:todo_app/res/constant/app_strings.dart';
import 'package:todo_app/view/add_tododialog_widget.dart';
import 'package:todo_app/view/todo_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      Container(),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appName)),
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
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const AddTodoDialogWidget(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
