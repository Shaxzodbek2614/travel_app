import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularPackageDetailsPage extends StatefulWidget {
  const PopularPackageDetailsPage({super.key});

  @override
  State<PopularPackageDetailsPage> createState() =>
      _PopularPackageDetailsPageState();
}

class _PopularPackageDetailsPageState extends State<PopularPackageDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white, // Orqa fonni oq qilish tavsiya etiladi
      body: Stack(
        children: [
          // 1. Orqa fondagi rasm
          Container(
            width: double.infinity,
            height: 350, // Rasmni biroz balandroq qildik
            child: Image.asset(
              "assets/cardimages/img2_1.png",
              fit: BoxFit.cover,
            ),
          ),

          // 2. Orqaga qaytish tugmasi
          Positioned(
            top: 50, // SafeArea uchun mosroq joy
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  // XATO SHU YERDA EDI: BorderRadius qo'shildi
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.9),
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),

          // 3. Pastki oq kontent qismi (Siz so'ragan qizil qism o'rniga)
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 280,
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white, // Oq rang sayohat ilovalari uchun mos
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("The Lind Boracay Resort",style: GoogleFonts.ubuntu(fontSize: 24,fontWeight: FontWeight.bold),),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.9),
                              ),
                              child: const Icon(Icons.bookmark_border , color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.red,),
                          Text("East Evritania Singapore",style: GoogleFonts.ubuntu(color: Colors.grey),),
                          Spacer(),
                          Text("\$520",style: TextStyle(color: Colors.blue,fontSize: 19),),
                          Text("/Person",style: TextStyle(color: Colors.grey,fontSize: 19),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: .center,
                        children: [
                          SizedBox(
                            width: 110,
                            height: 30,
                            child: Stack(
                              children: [
                                Positioned(
                                    child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red
                                  ),
                                )),
                                Positioned(
                                  left: 20,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.yellow
                                      ),
                                    )),
                                Positioned(
                                  left: 40,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green
                                      ),
                                    )),
                                Positioned(
                                  left: 60,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.orange
                                      ),
                                    )),
                                Positioned(
                                  left: 80,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.star,color: Colors.orange,size: 30,),
                          Text("4.8",style: TextStyle(fontSize: 20),),
                          SizedBox(width: 15,),
                          Expanded(child: ElevatedButton(onPressed: (){

                          }, child: Text("Check Availability"),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white),))
                        ],
                      )
                    ],
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
