import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color:  Color(0xff24263B),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30))
        ),
        child:Text('BMI Calculator',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
      );
  }
}