import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/pages/register/set_new_password_page.dart';
import 'package:travel_app/pages/register/vertification_page.dart';
import 'package:travel_app/themes/app_colors.dart';

import '../../components/build_text_feild.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late TextEditingController emailController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.of(context).backgroundColor,
        title: Text(
          "Security",
          style: GoogleFonts.elmsSans(
            fontWeight: FontWeight.bold,
            color: AppColors.of(context).titleColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Text(
                  "Reset Password",
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
              "Please enter your email address to request a password reset",
              style: TextStyle(color: AppColors.of(context).textColor),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
              controller: emailController,
              hintText: "Type your email",
              prefixIcons: Icons.email_outlined,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VertificationPage(email: emailController.text,type: "reset",)));
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
