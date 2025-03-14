import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint , this.isPassword = false , this.controller , this.customValidator});
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? customValidator;

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(left: 30 , right: 30 , top: 20) ,
            padding: EdgeInsets.only(left: 10),
           child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            validator: customValidator,
            decoration: InputDecoration(
              labelText: hint,
              border: OutlineInputBorder(),
          ),
           ),
           );
  }
}