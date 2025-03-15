import 'package:flutter/material.dart';
import 'package:flutter_g1/bmi/colors.dart';
import 'package:flutter_g1/bmi/screens/result.dart';
import 'package:flutter_g1/bmi/styles.dart';
import 'package:flutter_g1/bmi/widgets/custom_appbar.dart';
import 'package:flutter_g1/bmi/widgets/custom_button.dart';
import 'package:flutter_g1/bmi/widgets/custom_card.dart';
import 'package:flutter_g1/bmi/widgets/round_button.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isMale = false;
  double height = 150;
  int age = 26;
  int weight = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c2135),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: CustomCard(
                          isActive: isMale,
                          content: Column(
                            children: [
                              Icon(Icons.male, size: 100, color: Colors.white),
                              Text('MALE', style: AppStyles.labelTextStyle),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: CustomCard(
                          isActive: !isMale,
                          content: Column(
                            children: [
                              Icon(
                                Icons.female,
                                size: 100,
                                color: Colors.white,
                              ),
                              Text('FEMALE', style: AppStyles.labelTextStyle),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomCard(
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height', style: AppStyles.labelTextStyle),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${height.toInt()}',
                              style: AppStyles.numberTextStyle,
                            ),
                            TextSpan(
                              text: 'Cm',
                              style: AppStyles.labelTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        min: 120,
                        max:250,
                        value: height, 
                        onChanged: (value){
                          setState(() {
                            height = value;
                          });
                        },
                        activeColor: AppColors.pink,),
                      SizedBox(width: double.infinity),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(children: [
                  CustomCard(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',style: AppStyles.labelTextStyle,),
                        Text('$weight',style: AppStyles.numberTextStyle,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundButton(icon: Icon(Icons.remove,color: Colors.white,),
                            onClick: () {
                              setState(() {
                                weight--;
                              });
                            },),
                            RoundButton(icon: Icon(Icons.add,color: Colors.white,), onClick: () {
                              setState(() {
                                weight++;
                              });
                            },),
                          ],
                        )
                      ],
                    ),
                  ),
                   CustomCard(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',style: AppStyles.labelTextStyle,),
                        Text('$age',style: AppStyles.numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundButton(icon: Icon(Icons.remove,color: Colors.white,),
                            onClick: () {
                              setState(() {
                                age--;
                              });
                            },),
                            RoundButton(icon: Icon(Icons.add,color: Colors.white,), onClick: () {
                              setState(() {
                                age++;
                              });
                            },),
                          ],
                        )
                      ],
                    ),
                   )]),
              ),
            ),
            CustomButton(
              btnTitle: 'Calculate',
              onClick: () {
                  var heightInMeter = height/100;
                  var bmi = weight / (heightInMeter * heightInMeter);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return Result(bmiResult: bmi);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
