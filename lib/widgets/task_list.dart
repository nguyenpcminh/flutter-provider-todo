import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/tasks_data.dart';
import 'package:to_do_list_app/widgets/task_title.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(builder: (context, tasksData, child) {
      return ListView.builder(
        itemBuilder: (context, index) => TaskTitle(
          title: tasksData.tasks[index].name,
          isChecked: tasksData.tasks[index].isDone,
          checkboxCallback: (checkboxState) => {
            tasksData.updateTask(tasksData.tasks[index])
          },
          longPressCallBack: (){
            tasksData.deleteTask(tasksData.tasks[index]);
          },
        ),
        itemCount: tasksData.count,
      );
    });
  }
}
