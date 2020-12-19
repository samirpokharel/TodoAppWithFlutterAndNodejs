import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/service/todo_services.dart';

class TodoItemCard extends StatefulWidget {
  final Todo todo;

  const TodoItemCard({Key key, this.todo}) : super(key: key);
  @override
  _TodoItemCardState createState() => _TodoItemCardState();
}

class _TodoItemCardState extends State<TodoItemCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => TodoServices().completTodo(widget.todo.id),
            child: Container(
              alignment: Alignment.center,
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: widget.todo.isComplet
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(width: 10),
          Text(
            "${widget.todo.title}",
            style: TextStyle(
              decoration: widget.todo.isComplet
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: Colors.white54,
              fontSize: 18,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () => TodoServices().deleteTodos(widget.todo.id),
            child: Icon(
              Icons.close,
              color: Colors.white38,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
