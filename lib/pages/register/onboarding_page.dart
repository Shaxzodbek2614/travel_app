import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/pages/register/sign_in_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container(color: Color(0xff0ea0d3),),),
              Expanded(child: Image.asset("assets/images/img.png",fit: BoxFit.cover,width: double.infinity,height: double.infinity,)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
            child: Column(
              crossAxisAlignment: .center,
              mainAxisSize: .max,
              children: [
                SizedBox(height: 50,),
                Text("Welcome Back!",style: GoogleFonts.elmsSans(color: Colors.black,fontSize: 34,fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                Text("Explore the new experience with Tralto",style: TextStyle(color: Colors.black54,fontSize: 18),),
                SizedBox(height: 40,),
                ElevatedButton.icon(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                }, label: Text("Continue With Email"),icon: Icon(Icons.email),style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white
                ),),
                SizedBox(height: 10,),
                ElevatedButton.icon(onPressed: (  ){}, label: Text("Continue With Google"),icon: Image.asset("assets/images/img_1.png",width: 20,),style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white
                ),),

              ],
            ),
          )
        ],
      ),
    );
  }
}
