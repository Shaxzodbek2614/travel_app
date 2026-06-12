import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelDetailsPage extends StatelessWidget {
  const TravelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Image.asset("assets/images/img_6.png", fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 280),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                "The Lind Boracay Resort",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: const Icon(
                                Icons.bookmark_border,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.orange),

                            const SizedBox(width: 5),

                            Text(
                              "East Evritania, Singapore",
                              style: TextStyle(color: Colors.grey.shade800),
                            ),
                            Spacer(),
                            Text(
                              "\$520",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "/Person",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Container(
                              width: 142,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 25,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 50,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 75,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 100,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "5K+",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 15),

                            Icon(Icons.star, color: Colors.orange),

                            SizedBox(width: 5),

                            Text(
                              "4.8",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            Spacer(),

                            GestureDetector(
                              onTap: (){
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: const Text(
                                  "Check Availability",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 35),

                        const Text(
                          "About Trip",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          "The Lind Boracay resort has its own train station and can be reached "
                          "from ether lau spezia or levantonipo.From la spezia, take the local train trendo "
                          "regionale in the direction of sestrin "
                          "levante and get off at the first stop. From levanto, take the regional train in "
                          "directionof la spezia centrale",
                          style: TextStyle(
                            height: 1.7,
                            color: Colors.grey.shade700,
                          ),
                        ),

                        const SizedBox(height: 35),

                        const Text(
                          "What's Included?",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(onTap: () {
                              showModalBottomSheet(context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent, builder: (context) {
                                return const FlightDetailsBottomSheet();
                                },
                              );},child: includeItem(Icons.flight, "Flight"),),
                            GestureDetector(onTap: (){},child: includeItem(Icons.directions_car, "Transfer"),),
                            GestureDetector(onTap: (){},child: includeItem(Icons.hotel, "Hotel"),),
                            GestureDetector(onTap: (){},child: includeItem(Icons.restaurant, "Food"),)
                          ],
                        ),
                        SizedBox(height: 40),
                        Text("Image and Videos",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 24
                        ),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [

                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade300,
                                    ),
                                    child: Image.asset("assets/image/img_11.png",fit: BoxFit.cover,),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                children: [

                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    height: 82,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade300,
                                    ),
                                    child: Image.asset("assets/image/img_10.png",fit: BoxFit.cover,),
                                  ),

                                  const SizedBox(height: 15),

                                  Row(
                                    children: [

                                      Expanded(
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          height: 82,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.grey.shade300,
                                          ),
                                          child: Image.asset("assets/image/img_9.png",fit: BoxFit.cover,),
                                        ),
                                      ),
                                      SizedBox(width: 10),

                                      Expanded(
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          height: 82,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.grey.shade300,
                                          ),
                                          child: Image.asset("assets/image/img_7.png",fit: BoxFit.cover,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade100
                            ),
                            onPressed: () {},
                            child: const Text("See all 156 Photo",style: TextStyle(
                              color: Colors.indigo
                            ),),
                          ),
                        ),
                        SizedBox(height: 100,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(onTap: (){
                Navigator.pop(context);
              },child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.arrow_back),
              ),)
            ),
          ),
        ],
      ),
    );
  }
  static Widget includeItem(IconData icon, String title) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, size: 35, color: Colors.blue),
        ),
        const SizedBox(height: 10),
        Text(title),
      ],
    );
  }
}

class FlightDetailsBottomSheet extends StatelessWidget {
  const FlightDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(onTap: (){
                  Navigator.pop(context);
                },child:
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.close),
                ),),
                Spacer(),
                Text(
                  "Flight Details",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),
              ],
            ),

            const SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                    const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      children: [

                        Row(
                          children: [

                            const Text(
                              "NYC",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 24,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            const Spacer(),

                            const Icon(
                              Icons.flight,
                              color: Colors.blue,
                            ),

                            const Spacer(),

                            const Text(
                              "SIN",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 24,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        const Row(
                          children: [
                            Text("New York"),
                            Spacer(),
                            Text(
                              "06h 30m",
                              style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text("Singapore"),
                          ],
                        ),

                        const SizedBox(height: 20),

                        const Row(
                          children: [
                            Text(
                              "19:00",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "01:30",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Divider(),

                        const SizedBox(height: 15),

                        Row(
                          children: [

                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.circle,
                              ),

                              /// RASM JOYI
                            ),

                            const SizedBox(width: 15),

                            const Expanded(
                              child: Text(
                                "American Airlines",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight:
                                  FontWeight.w500,
                                ),
                              ),
                            ),

                            const Text(
                              "\$160",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}