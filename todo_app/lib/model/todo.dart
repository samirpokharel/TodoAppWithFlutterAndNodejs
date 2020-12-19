
class Todo {
  String title;
  bool isComplet;
  String id;
  Todo({this.isComplet, this.title, this.id});
  
  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map["_id"],
      isComplet: map["isComplet"],
      title: map["title"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"title": title};
  }
}
