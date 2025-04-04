import 'package:flutter/material.dart';
import 'package:flutter_g1/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskTitleCont = TextEditingController();
  final taskDescribtionCont = TextEditingController();
  final taskTimeCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo'),),
      body: Center(
        child: Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       showModalBottomSheet(context: context, builder: (context){
        return Container(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              CustomTextField(hint: 'task title', controller: taskTitleCont,),
              CustomTextField(hint: 'task description', controller: taskDescribtionCont,),
              CustomTextField(hint: 'task time', controller: taskTimeCont,),
              ElevatedButton(onPressed: (){
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
}