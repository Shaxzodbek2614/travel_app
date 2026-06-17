import 'package:flutter/material.dart';
import 'package:travel_app/themes/app_colors.dart';
class BuildTextFeild extends StatelessWidget {
  TextEditingController? controller;
  String hintText;
  IconData? suffixIcon;
  IconData prefixIcons;
  bool obsureText;
  VoidCallback? onPressed;
  String type;
  String? password;

  BuildTextFeild({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.prefixIcons ,
    this.obsureText = false,
    this.onPressed,
    this.type = "email",
    this.controller,
    this.password
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcons,color: AppColors.of(context).textColor,),
        hintText: hintText,
        suffixIcon: IconButton(onPressed: onPressed, icon: Icon(suffixIcon, color: AppColors.of(context).textColor,)),
      
      ),
      controller: controller,
      obscureText: obsureText,
      validator: (value){
        if(value==null || value.isEmpty){
          return type=="email" ?"Email bo'sh bo'lishi mumkin emas": "Password bo'sh bo'lishi mumkin emas";
        }else if(type=="email"){
          if(!value.endsWith("@gmail.com")) return "Email xato";
        }else if(type=="password"){
          if(value.length<8){
            return "Parol kamida 8 ta belgidan iborat bo'lsin";
          }
          else{
            return null;
          }
        }else if(type=="confirmpassword"){
          if(controller?.text!=password){
            return "Parol bir xil emas";
          }else{
            return null;
          }
        }else if(type=="fullname"){
          if(value == null || value.isEmpty){
            return "Fullname bo'sh bo'lishi mumkin emas";
          }else{
            return null;
          }
        }
        return null;
      },
    );
  }
}