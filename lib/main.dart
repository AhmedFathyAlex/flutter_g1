import 'package:flutter/material.dart';
import 'package:flutter_g1/ecommerce/data/cart_model.dart';
import 'package:flutter_g1/ecommerce/presentation/screens/ecommerce_home.dart';
import 'package:flutter_g1/todo/data/task_database.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  
  WidgetsFlutterBinding.ensureInitialized();
   await TasksDatabase.initializeDatabase();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString('name');
  bool hasName = name != null && name.isNotEmpty;
 
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MainApp(hasName: hasName,name: name,)));
}

class MainApp extends StatelessWidget {

  // constructor
   MainApp({super.key ,required this.hasName , this.name});
  bool hasName;
  String? name;
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      home: EcommerceHome(),
      debugShowCheckedModeBanner: false,
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
// shared preferences
// sqflite "relational database"
// hive ' no sql database



