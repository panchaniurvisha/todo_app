// To parse this JSON data, do
//
//     final toDoModel = toDoModelFromJson(jsonString);

import 'dart:convert';

ToDoModel toDoModelFromJson(String str) => ToDoModel.fromJson(json.decode(str));

String toDoModelToJson(ToDoModel data) => json.encode(data.toJson());

class ToDoModel {
  String? task;
  String? description;
  String? time;

  ToDoModel({
    this.task,
    this.description,
    this.time,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        task: json["task"],
        description: json["description"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "task": task,
        "description": description,
        "time": time,
      };
}
