import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  const Flag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.attach_file,color:Colors.blue)),
              Expanded(child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(30)
                ),
              )),
               IconButton(onPressed: (){},
                icon: Icon(Icons.send,color:Colors.blue)),
            ],
          )
        ],
      ),
    );
  }
}