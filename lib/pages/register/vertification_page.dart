import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:travel_app/pages/register/set_new_password_page.dart';

class VertificationPage extends StatefulWidget {
  String type;
  String email;
  VertificationPage({super.key,required this.email,required this.type});

  @override
  State<VertificationPage> createState() => _VertificationPageState();
}

class _VertificationPageState extends State<VertificationPage> {
  String otpCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Verification",
          style: GoogleFonts.elmsSans(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Image.asset("assets/logo/img.png", width: 22),
                SizedBox(width: 10),
                Text(
                  "TRALTO",
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
              "We've send you the verification code on",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "*****${widget.email.substring(6)}",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 30,),
            OtpKit(
              fieldCount: 4,
              buttonBorderRadius: 30,
              buttonText: "Confirm",
              // Custom field configuration
              fieldConfig: OtpFieldConfig(
                fieldWidth: 60,
                fieldHeight: 60,
                borderRadius: 30, // Circular fields
                borderWidth: 2,
                fieldShape: OtpFieldShape.circle,
                // Typography34w
                fieldFontSize: 24,
                fieldFontWeight: FontWeight.bold,
              ),

              onVerify: (otp) async{
                if(widget.type=="signup"){

                }else if(widget.type=="reset"){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SetNewPasswordPage()));
                }
                return  true;
              },
              onResend: (){},
            )
          ],
        ),
      ),
    );
  }
}
