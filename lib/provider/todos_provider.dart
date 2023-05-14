import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/todo_field.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> todos = [
    Todo(
        createdTime: DateTime.now(),
        title: "Buy Food",
        description: "-Eggs\n-Milk\n-Bread\n-Water"),
    Todo(
        createdTime: DateTime.now(),
        title: "plan family trip to Norway",
        description: "-Rent some hotels\n-Rent a car\n-Pack suitcase"),
    Todo(createdTime: DateTime.now(), title: "Walk the Dog"),
    Todo(createdTime: DateTime.now(), title: "Plan Jacobs birthday party")
  ];
  List<Todo> get _todos => todos.where((todo) => todo.isDone == false).toList();
}
