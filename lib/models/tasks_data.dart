import 'package:flutter/foundation.dart';
import 'package:to_do_list_app/models/tasks.dart';
import 'dart:collection';

class TasksData extends ChangeNotifier{
   List<Task> _tasks = [
    Task(name: 'This egg'),
    Task(name: 'This milk'),
    Task(name: 'This bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get count {
    return _tasks.length;
  }

  void addNewTask(newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    if (task.isDone){
      _tasks.remove(task);
      notifyListeners();
    }
  }
}