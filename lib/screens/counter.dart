import 'package:flutter/material.dart';
import 'package:flutter_g1/screens/welcome_widget.dart';

class Counter extends StatefulWidget{
  const Counter({super.key});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter>{
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context) ?  IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_outlined, ),
          ) : null,
        title: const Text('Counter App'),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 150,height: 200,
            decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(image: AssetImage('assets/baloon.jpg',
            ),
            fit: BoxFit.cover 
            )
          ),
              ),
         TextButton(
          child: Text('Navigate to Welcome'),
          onPressed: () {
            // Navigator.push(context,
            //   MaterialPageRoute(
            //     builder: (context){
            //       return WelcomeWidget();
            //     }
            //   )
            // );
            Navigator.pushNamed(context, '/welcome');
          },
         )
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(onPressed: () {
      setState(() {
        counter++;
      }); // to update the UI
    },),
    );
  }
}