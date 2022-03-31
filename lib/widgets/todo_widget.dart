import 'package:flutter/material.dart';
import '../model/horizontalImageList.dart';

class TodoWidget extends StatefulWidget {
  final HorizontalImageList todo;

  TodoWidget({
    required this.todo,
  });

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  late List<HorizontalImageList> task;

  late String imagePath;


  @override
  void initState() {
    super.initState();

    imagePath = widget.todo.imagePath;

  }

  @override
  Widget build(BuildContext context) => buildTodo(context) ;

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => {},
        child: Container(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(widget.todo.imagePath),
                      width: 50,
                      height: 50,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      );





}
