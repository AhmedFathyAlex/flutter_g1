import 'package:flutter/material.dart';
import 'package:flutter_g1/bmi/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.btnTitle , this.onClick});
  final String btnTitle;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15) ,topRight:  Radius.circular(15))
        ),
        child: Text(btnTitle,style: TextStyle(fontSize: 32 , fontWeight: FontWeight.w600,color: Colors.white),),
      ),
    );
  }
}