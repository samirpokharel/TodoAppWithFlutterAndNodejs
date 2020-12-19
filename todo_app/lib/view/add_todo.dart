import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/service/todo_services.dart';

class AddTodoForm extends StatefulWidget {
  @override
  _AddTodoFormState createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  TextEditingController _titleController;
  @override
  void initState() {
    _titleController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: TextFormField(
              controller: _titleController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                height: 1.5,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 17,
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'eg. Homework',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () async {
              print(_titleController.text);
              Todo newTodo = Todo(title: _titleController.text);
              if (_titleController.text.isNotEmpty) {
                await TodoServices()
                    .createNewTodos(newTodo)
                    .whenComplete(() => Navigator.pop(context));
              }
            },
            child: Container(
              height: 70,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.white, size: 40),
                  Text(
                    "ADD",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
