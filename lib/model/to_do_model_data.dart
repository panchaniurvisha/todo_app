class ToDoModelData {
  String? title;
  String? time;
  String? content;
  String? image;

  ToDoModelData({this.title, this.image, this.time, this.content});

  ToDoModelData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    time = json['time'];
    content = json['content'];
  }
}
