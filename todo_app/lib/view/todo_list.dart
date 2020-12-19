import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/service/todo_services.dart';
import 'package:todo_app/view/add_todo.dart';
import 'package:todo_app/view/todo_item_tile.dart';

import '../model/todo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  StreamController _streamController;
  Stream stream;

  @override
  void initState() {
    _streamController = StreamController();
    stream = _streamController.stream;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TodoServices().getAllTodos().then((value) {
      if (value != null) {
        _streamController.add(value);
      }
      setState(() {});
    });
    void showAddModal() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Theme.of(context).primaryColor,
        enableDrag: true,
        useRootNavigator: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        builder: (context) => Container(height: 350, child: AddTodoForm()),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<Todo> todos = snapshot.data;
                return Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.pink),
                        SizedBox(width: 10),
                        Text(
                          "Todo List",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(color: Colors.white38),
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: todos.length,
                          itemBuilder: (context, i) {
                            return TodoItemCard(todo: todos[i]);
                          },
                          separatorBuilder: (context, i) {
                            return Divider(
                              color: Colors.white10,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () => showAddModal(),
        child: Icon(
          Icons.add,
          size: 55,
        ),
      ),
    );
  }
}
