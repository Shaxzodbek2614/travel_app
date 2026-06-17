import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/pages/register/reset_password_page.dart';
import 'package:travel_app/pages/register/sign_up_page.dart';
import 'package:travel_app/themes/app_colors.dart';

import '../../components/build_signin_button.dart';
import '../../components/build_text_feild.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final globalKey = GlobalKey<FormState>();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.of(context).backgroundColor,
        title: Text(
          "Sign In",
          style: GoogleFonts.elmsSans(
            fontWeight: FontWeight.bold,
            color: AppColors.of(context).textColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
         // mainAxisAlignment: .spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/logo/img.png", width: 22),
                SizedBox(width: 10),
                Text(
                  "TRALTO",
                  style: GoogleFonts.elmsSans(
                    fontSize: 22,
                    color: AppColors.of(context).titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Give credentials to sign in your account",
              style: TextStyle(color: AppColors.of(context).textColor),
            ),
            SizedBox(height: 15),
            Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: AppColors.of(context).titleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  BuildTextFeild(
                    hintText: "Type your email",
                    prefixIcons: Icons.email_outlined,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: AppColors.of(context).titleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  BuildTextFeild(
                    type: "password",
                    hintText: "Type your password",
                    prefixIcons: Icons.lock_outline,
                    suffixIcon: isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    obsureText: isVisible ? false : true,
                    onPressed: () {
                      setState(() {
                        isVisible = (isVisible == false) ? true : false;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: .end,
                    children: [
                      TextButton(
                        onPressed: () { 
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordPage()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: AppColors.of(context).forgotPasswordText),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if(globalKey.currentState!.validate()){}
                    },
                    child: Text("Sign In"),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          endIndent: 10,
                          height: 2,
                        ),
                      ),
                      Text("or continue with"),
                      Expanded(child: Divider(
                        indent: 10,
                      ))
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      BuildSignInButton(icon: Icons.facebook, onPressed: (){},color: Colors.blue,),
                      BuildSignInButton(image: Image.asset("assets/images/img_1.png",width: 20,), onPressed: (){},color: Colors.blue,),
                      BuildSignInButton(icon: Icons.apple, onPressed: (){},color: AppColors.of(context).titleColor,),
                    ],
                  ),

                  SizedBox(height: 40,),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.elmsSans(color: AppColors.of(context).titleColor,fontSize: 20),
                      children: [

                        TextSpan(
                          text: "Don't have an account?",
                        ),
                        TextSpan(
                            text: "Sign Up",
                          style: TextStyle(color: AppColors.of(context).signText),
                          recognizer: TapGestureRecognizer()..onTap = (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpPage()));
                          }
                        ),

                      ]
                    )),
                  ),
                  SizedBox(height: 40,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

