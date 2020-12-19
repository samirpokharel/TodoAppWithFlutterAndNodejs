import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/service/todo_provider.dart';
import 'package:todo_app/view/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>.value(
      value: TodoProvider(),
      child: MaterialApp(
        title: 'Todo app',
        home: TodoList(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff202030),
          scaffoldBackgroundColor: Color(0xff202030),
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
