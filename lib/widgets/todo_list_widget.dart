
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task/widgets/todo_widget.dart';

import '../model/horizontalImageList.dart';
import '../provider/provider.dart';

class TodoListWidget extends StatefulWidget {
  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  late List<HorizontalImageList> _todos;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    final provider = Provider.of<TodosProvider>(context);

    _todos = provider.todos;
    var todos = _todos;

    return todos.isEmpty
        ? Center(
            child: Text(
             '', style: TextStyle(fontSize: 20),
            ),
          )
        : Container(
      height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
             // physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              separatorBuilder: (context, index) => Container(width: 8),
              itemCount: todos.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return TodoWidget(todo: todo);
              },
            ),
          );
  }
}
