import 'package:flutter/widgets.dart';
import 'package:todo_app/model/todo.dart';

class TodoProvider extends ChangeNotifier{
  List<Todo> todos;

  getAllTodos(List<Todo> getTodos){
    todos = getTodos;
    notifyListeners();
  }

}