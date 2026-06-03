import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  void onTap(int index){

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverAppBar(
              pinned: true,
              expandedHeight: 150,
              leading: Center(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    // XATO TUZATILDI: BorderRadius qo'shildi
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange,
                  ),
                  child: Image.asset("assets/images/img_2.png"),
                ),
              ),
              title: Row(
                // XATO TUZATILDI: MainAxisSize.min
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.location_on, color: Colors.red),
                  Text("New York, USA"),
                ],
              ),
              centerTitle: true,
              actions: [
                Card(
                  elevation: 3,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.apps),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Explore the\nBeautiful World",
                    style: GoogleFonts.openSans( // elmsSans o'rniga openSans
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Qidiruv qismi (Header)
          SliverPersistentHeader(
            pinned: true,
            delegate: MyDelegete(),
          ),

          // Horizontal ListView qismi
          SliverToBoxAdapter(
            child: SizedBox(
              height: 130, // XATO TUZATILDI: Horizontal listga balandlik berish shart!
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: ()=>onTap(index),
                    child: Column(
                      crossAxisAlignment: .center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: EdgeInsets.all(20),
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // XATO TUZATILDI: BorderRadius qo'shildi
                            borderRadius: BorderRadius.circular(15),
                            border: currentIndex==index?Border.all(width: 2,color: Colors.blue):null
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset("assets/images/img_3.png", fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Packages",style: TextStyle(color: currentIndex==index?Colors.blue:Colors.black),)
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // Pastda kontent ko'rinishi uchun bo'sh joy
          SliverToBoxAdapter(
            child: Container(height: 500, color: Colors.transparent),
          )
        ],
      ),
    );
  }
}

class MyDelegete extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor, // Orqa fon rangi
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Row(
        // XATO TUZATILDI: CrossAxisAlignment.center
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search packages",
                // XATO TUZATILDI: BorderRadius qo'shildi
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 13),
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.orange,
              // XATO TUZATILDI: BorderRadius qo'shildi
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.orange,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tune, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}