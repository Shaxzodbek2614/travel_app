import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/components/firstcarwidget.dart';
import 'package:travel_app/components/secondwidget.dart';
import 'package:travel_app/components/thirdwidget.dart';
import 'package:travel_app/models/first_card.dart';
import 'package:travel_app/models/listcard.dart';
import 'package:travel_app/models/listcard.dart';
import 'package:travel_app/models/listcard.dart';
import 'package:travel_app/models/listcard.dart';
import 'package:travel_app/models/listcard.dart';
import 'package:travel_app/models/second_card.dart';


class HomePage extends StatefulWidget {


  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PageController _controller;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
  }


  int currentIndex = 0;
  void onTap(int index){

    setState(() {
      currentIndex = index;
    });
  }


   List<FirstCard> Cards = [
    FirstCard(
      name: 'Apanemo Resort',
      location: 'East Evritania',
      rating: 4.9,
      price: '\$90/Night',
      image: "assets/cardimages/img.png",
      icon: Icons.account_balance_outlined,
    ),
    FirstCard(
      name: 'Laguna Resort',
      location: 'Santorini',
      rating: 4.7,
      price: '\$110/Night',
      image: "assets/cardimages/img_1.png",
      icon: Icons.home_outlined,
    ),
    FirstCard(
      name: 'Ocean Breeze',
      location: 'Bali, Indonesia',
      rating: 4.8,
      price: '\$75/Night',
      image: "assets/cardimages/img_2.png",
      icon: Icons.forest_outlined,
    ),
  ];

   List<SecondCard> popularItems = [
    SecondCard(
      image: "assets/cardimages/img2_1.png",
      title: 'The Blue House',
      subtitle: '2 days 3 night full package',
      rating: 4.8,
    ),
    SecondCard(
      image: "assets/cardimages/img2_2.png",
      title: 'Mountain Retreat',
      subtitle: '3 days 4 night adventure',
      rating: 4.6,
    ),
    SecondCard(
      image: "assets/cardimages/img2_3.png",
      title: 'Dubai',
      subtitle: '5 days 6 night luxury stay',
      rating: 4.9,
    ),
  ];

  List<Listcard> ListPackages =  [
    Listcard(
      name: 'Imperial Luxury Hotel',
      location: 'Queensland',
      price: '\$120/Night',
      rating: 4.9,
      reviews: '7.2K Reviews',
      image: "assets/cardimages/listimage/img.png",
    ),
    Listcard(
      name: 'Walkabout Beach Hotel',
      location: 'New Zealand',
      price: '\$100/Night',
      rating: 4.8,
      reviews: '6.4K Reviews',
      image: "assets/cardimages/listimage/img_1.png",
    ),
    Listcard(
      name: 'Antlers Hilton Resort',
      location: 'Singapore',
      price: '\$100/Night',
      rating: 4.6,
      reviews: '3.9K Reviews',
      image: "assets/cardimages/listimage/img_2.png",
    ),
    Listcard(
      name: 'Imperial Luxury Hotel',
      location: 'Queensland',
      price: '\$120/Night',
      rating: 4.9,
      reviews: '7.2K Reviews',
      image: "assets/cardimages/listimage/img_3.png",
    ),
  ];

   int currentpage = 0;

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
                    style: GoogleFonts.ubuntu( // elmsSans o'rniga openSans
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
              height: 160, // XATO TUZATILDI: Horizontal listga balandlik berish shart!
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: ()=>onTap(index),
                    child: Column(
                      crossAxisAlignment: .center,
                      mainAxisSize: .min,
                      children: [
                        Container(
                          width: 80,
                          height: 85,
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
          SliverToBoxAdapter(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('122 Packages', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    Text('See All', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xFF6366F1))),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:SizedBox(
              height: 270,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: Cards.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, i) => FirstCardWidget(card: Cards[i]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15,),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Packages', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    Text('See All', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF6366F1))),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15,),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 210,
              child: PageView.builder(
                  physics: const PageScrollPhysics(),
                controller: _controller,
                  itemCount: popularItems.length,
                  onPageChanged: (index) {
                  setState(() {
                    currentpage = index;
                  });
                  },
                  itemBuilder: (context,index){
                    return Padding(
                        padding:EdgeInsets.symmetric(horizontal: 20),
                        child: SecondWidget(item: popularItems[index]),
                    );
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15,),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Packages', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  Text('See All', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF6366F1))),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, i) => ThirdWidget(package: ListPackages[i]),
              childCount: ListPackages.length,
            ),
          ),

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