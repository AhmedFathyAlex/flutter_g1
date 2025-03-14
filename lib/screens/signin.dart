import 'package:flutter/material.dart';
import 'package:flutter_g1/widgets/custom_text_field.dart';

class Signin extends StatelessWidget {
   Signin({super.key});
  final TextEditingController emailController =  TextEditingController();
  final TextEditingController passwordController =  TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://img.freepik.com/free-vector/login-concept-illustration_114360-739.jpg'),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(30),
              ),
             ), 
             CustomTextField(hint: 'Email',controller: emailController,
             customValidator: (email) {
                 if(email!.contains('@') 
               && email.contains('.')){
                return null;
               }
            return 'Incorrect email';
             },
             ),
             CustomTextField(hint: 'Password',controller: passwordController , isPassword: true,
             customValidator: (password) {
                if(password!.length >=8){
                  return null;
                }
                return 'Weak Password';
             },
             ),
             TextButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/signup');
             }, child: Text('create an account'),),
             SizedBox(height: 20,),
             ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Sign In Successfull'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 1),)
              );
                }
                else{
                   ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 1)));
                }  
             },
             
              child: Text('Sign In'),),
            ],),
        ),
      ),
    );
  }
}