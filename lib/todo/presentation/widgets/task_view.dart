import 'package:flutter/material.dart';
import 'package:flutter_g1/todo/data/task_model.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key,required this.task , this.onClick});
  final TaskModel task;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.cyan,
        title: Text(task.title),
        subtitle: Text(task.description),
        leading: Text(task.date),
        trailing: IconButton(onPressed: onClick, icon: Icon(Icons.delete, color: Colors.red,)),
      ),
    );
  }
}