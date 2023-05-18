import 'package:flutter/material.dart';
import 'package:todo_app/res/constant/app_colors.dart';
import 'package:todo_app/res/constant/app_strings.dart';
import 'package:todo_app/view/home/components/list_view_separate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text(AppStrings.appName)),
        body: const ListViewSeparate(),
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
