import 'package:flutter/material.dart';
import 'package:flutter_g1/bmi/screens/bmi_calculator.dart';
import 'package:flutter_g1/bmi/screens/result.dart';
import 'package:flutter_g1/screens/counter.dart';
import 'package:flutter_g1/screens/flag.dart';
import 'package:flutter_g1/screens/signin.dart';
import 'package:flutter_g1/screens/signup.dart';
import 'package:flutter_g1/screens/welcome_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {

  // constructor
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        '/signin' : (context) => Signin(),
        '/signup' : (context) => Signup(),
        '/counter' : (context) => Counter(),
        '/welcome' : (context) => WelcomeWidget(),
        '/bmiCalculator' : (context) => BmiCalculator(),
        // '/result' : (context) => Result(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/bmiCalculator',
    );
  }
}
// Built-in Widgets
// 1- Material app  [home, debugShowCheckedModeBanner]
// 2- Scaffold      [appBar, body]
// 3- AppBar        [actions, title, backgroundColor]
// 3- Center      (center the child widget)
// 4- Text      [style]
// 5- IconButton      [onPressed, icon]
// 6- TextButton      [onPressed, child]
// 6- FloatingActionButton      [onPressed, child]
// 8- Column      [children, mainAxisAlignment] `vertical alignment`
// 9- Row      [children, mainAxisAlignment] `horizontal alignment`
// 10- Container      [alignment, width, height, decoration]
// 11- BoxDecoration      [color, borderRadius]
// 12- TextStyle      [fontSize]
// stateless vs stateful widget
// Navigator - CanPop
// Image - AssetImage - DecorationImage - networkImage
// Expanded
// Textfield [controller - obsecureText - decoration]
// ElevatedButton
// TextButton
// SizedBox
// anonumous navigation vs named navigation
// Navigator.push -> Navigator.pushNamed
// Navigatour.pushReplacement -> Navigator.pushReplacementNamed
// Navigator 2
// Text Field
// Text Form Field
// form Widget
// keys
// SingleChildScrollView



