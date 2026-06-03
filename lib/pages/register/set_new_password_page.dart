import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/build_text_feild.dart';

class SetNewPasswordPage extends StatefulWidget {
  const SetNewPasswordPage({super.key});

  @override
  State<SetNewPasswordPage> createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {

  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController emailController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
  }

  final globalKey = GlobalKey<FormState>();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Security",
          style: GoogleFonts.elmsSans(
            fontWeight: FontWeight.bold,
            color: Colors.black,
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
                  "New Password",
                  style: GoogleFonts.elmsSans(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Your password must  different from your previous password",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 40),
            SizedBox(height: 10),
            Form(
              key: globalKey,
                child: Column(
                  crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                BuildTextFeild(
                  password: confirmPasswordController.text,
                  controller: passwordController,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                BuildTextFeild(
                  password: passwordController.text,
                  controller: confirmPasswordController,
                  type: "confirmpassword",
                  hintText: "Re-type your password",
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
              ],
            )),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if(globalKey.currentState!.validate()){

                }
              },
              child: Text("Continue"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
