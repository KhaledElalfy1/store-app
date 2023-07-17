import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
   CustomTextFiled({super.key, this.inputType,this.hintText,this.onChange,this.obscureText=false});
  String? hintText;
  bool? obscureText;
  TextInputType? inputType;
  Function(String)?onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      onChanged: onChange,
      keyboardType: inputType,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
              color: Colors.black
          ) ,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black
          ),
        ),
        hintText: hintText,
        label: Text(hintText!),
      ),
    );
  }
}
