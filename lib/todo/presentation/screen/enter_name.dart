import 'package:flutter/material.dart';
import 'package:flutter_g1/todo/presentation/screen/home_screen.dart';
import 'package:flutter_g1/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterName extends StatelessWidget {
   EnterName({super.key});
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Enter Name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(hint:'Enter your name here!', controller: nameController,),
            ElevatedButton(onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('name', nameController.text);
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => HomeScreen(name: nameController.text,)));
            }, child: Text('Go to Tasks'))
          ],
        ),
      ),
    );
  }
}