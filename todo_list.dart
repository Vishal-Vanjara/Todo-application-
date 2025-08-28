import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TodoList extends StatefulWidget {
  const TodoList({
    super.key,
    required this.taskname,
    required this.taskcompleted,
    required this.onchanged,
    required this.deleteFunction,
  });

  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext)?deleteFunction;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
        bottom: 0,
      ),

      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),

            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.orangeAccent,
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: widget.taskcompleted,
                onChanged: widget.onchanged,
                activeColor: Colors.orange.shade50,
                checkColor: Colors.black,
                side: BorderSide(
                  color: Colors.black,
                ),
              ),
              Text(
                widget.taskname,
                style: TextStyle(
                  fontSize: 18,
                  decoration:widget.taskcompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
