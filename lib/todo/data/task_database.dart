import 'dart:developer';
import 'package:flutter_g1/todo/data/task_model.dart';
import 'package:sqflite/sqflite.dart';

class TasksDatabase {
  static late Database _db;
  static final tableName = 'tasks';
  static final titleCol = 'title';
  static final descCol = 'desc';
  static final dateCol = 'date';
  static Future<void> initializeDatabase() async {
    _db = await openDatabase(
      'tasks2.db',
      version: 1,
      onCreate: (database, version) {
        // create tables only once
        print('Database created');
        database.execute('CREATE TABLE $tableName (id INTEGER PRIMARY KEY, $titleCol TEXT, $descCol TEXT, $dateCol TEXT)');
      },
      onOpen: (database) {
        print('Database opened');
      },
    );
  }
  static void insertTask(TaskModel task) async{
  int row = await  _db.insert(tableName, {
      titleCol : task.title,
       descCol : task.description,
      dateCol : task.date
    });

    print('The task added successfully , row number $row');
  }

  static Future<List<TaskModel>> getAllTasks() async{
    var tasks = <TaskModel>[];
    log('Tasks before : ${tasks.length}');
    final result = await _db.rawQuery('SELECT * FROM $tableName');
    for (var taskMap in result){
      var model = TaskModel.fromJson(taskMap);
      tasks.add(model);
    }
      log('Tasks After : ${tasks.length}');
    return tasks;
  }
}
