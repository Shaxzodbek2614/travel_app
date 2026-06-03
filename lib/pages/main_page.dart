import 'package:flutter/material.dart';
import 'package:travel_app/pages/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    Container(color: Colors.yellow,),
    Container(color: Colors.red,),
    Container(color: Colors.orange,),
  ];

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined),label: "My Trip"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: "Saved"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
      ]),
    );
  }
}
