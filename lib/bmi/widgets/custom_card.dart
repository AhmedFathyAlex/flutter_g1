import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.content , this.isActive = true});
  final Widget? content;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ?  Color(0xff333244) : Color(0xff24263B),
          borderRadius: BorderRadius.circular(10)
        ),
        child: content,
      ),
    );
  }
}