import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_g1/bmi/styles.dart';
import 'package:flutter_g1/bmi/widgets/custom_appbar.dart';
import 'package:flutter_g1/bmi/widgets/custom_button.dart';
import 'package:flutter_g1/bmi/widgets/custom_card.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.bmiResult});
  final double bmiResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xff1c2135),
      body: SafeArea(child: Column(
        children: [
          CustomAppbar(),
          Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: CustomCard(
            content: Center(
              child: Text('${bmiResult.toStringAsFixed(1)}',style: AppStyles.numberTextStyle,),
            ),
          ),)),
          CustomButton(btnTitle: 'RE - Calculate',onClick: () {
            Navigator.pushReplacementNamed(context,'/bmiCalculator');
          },)
        ],
      )),
    );
  }
}