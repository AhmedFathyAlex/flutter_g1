import 'package:flutter/material.dart';
import 'package:flutter_g1/todo/data/task_database.dart';
import 'package:flutter_g1/todo/data/task_model.dart';
import 'package:flutter_g1/todo/presentation/widgets/task_view.dart';
import 'package:flutter_g1/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key , required this.name});
  final String name;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskTitleCont = TextEditingController();
  final taskDescribtionCont = TextEditingController();
  final taskTimeCont = TextEditingController();
  
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello ${widget.name}'),),
      body: Center(
        child: ListView.builder(itemBuilder: (context,index){
          return TaskView(task: tasks[index] ,
           onClick: () {
            TasksDatabase.deleteTask(tasks[index]); // Delete from DB
            setState(() {
              tasks.remove(tasks[index]);   // Delete from listView
            });
          },);
        },
         itemCount: tasks.length,)
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       showModalBottomSheet(context: context, builder: (context){
        return SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              CustomTextField(hint: 'task title', controller: taskTitleCont,),
              CustomTextField(hint: 'task description', controller: taskDescribtionCont,),
              CustomTextField(hint: 'task date', controller: taskTimeCont,),
              ElevatedButton(onPressed: (){
                TaskModel taskModel = TaskModel(title: taskTitleCont.text,
                 description: taskDescribtionCont.text, 
                 date: taskTimeCont.text);
                  setState(() {
                    tasks.add(taskModel);
                  });
                  TasksDatabase.insertTask(taskModel);
                taskTitleCont.clear();
                taskDescribtionCont.clear();
                taskTimeCont.clear();
                Navigator.pop(context);
              }, child: Text('Save'))
            ],
          ),
        );
       } );
      } ,
       child: Icon(Icons.add),),
    );
  }

  fetchData()async{
  tasks =  await TasksDatabase.getAllTasks();
  setState(() {});
  }
}