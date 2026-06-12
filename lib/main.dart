import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/home/popular_ontap.dart';
import 'package:travel_app/pages/home/popular_package_details_page.dart';
import 'package:travel_app/pages/main_page.dart';
import 'package:travel_app/pages/register/onboarding_page.dart';
import 'package:travel_app/pages/register/reset_password_page.dart';
import 'package:travel_app/pages/register/set_new_password_page.dart';
import 'package:travel_app/pages/register/sign_up_page.dart';
import 'package:travel_app/pages/register/vertification_page.dart';
import 'package:travel_app/pages/splash/splash_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized(); // shu qatorni qo'shing
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelDetailsPage(),
    );
  }
}
