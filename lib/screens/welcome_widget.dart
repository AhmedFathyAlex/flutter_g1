import 'package:flutter/material.dart';
import 'package:flutter_g1/screens/counter.dart';

class WelcomeWidget extends StatelessWidget {
   WelcomeWidget({super.key});

   final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // vertical alignment
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
                validator: (email) {
                  // return null if the validator ok
                  //return String if there is an error
                  if(email!.contains('@') && email!.contains('.')){
                    return  null;
                  }
                  else{
                    return 'Invalid Email';
                  }
                },
              ),
              TextFormField(
                obscureText: true,
                 decoration: InputDecoration(
                  hintText: 'password'
                ),
                validator: (password) {
                  if(password!.length >= 8){
                    return null;
                  }
                  else{
                    return 'weak password';
                  }
                },
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
               if(formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login Success'),duration: Duration(seconds: 1),));
               }else{
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login Failed'),duration: Duration(seconds: 1),));
               }

              }, child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
