import 'package:flutter/material.dart';

class MyCardDrink extends StatelessWidget {
  MyCardDrink({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
  String name;
  String image;
  String price;
  String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          //card
          Container(
            alignment: Alignment.bottomCenter,
            height: 160,
            width: double.infinity,
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Stack(
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,

                  child: SizedBox(height: 120, width: double.infinity),
                ),
                //name & title of drink
                Positioned(
                  top: 25,
                  left: 100,

                  child: SizedBox(
                    height: 100,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        // SizedBox(height: 5),
                        Text(
                          description,
                          maxLines: 1,

                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 67, 65, 65),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                // arrow icon
                Positioned(
                  bottom: 15,
                  right: 20,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 67, 65, 65),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //image of drink
          Positioned(
            top: 0,
            bottom: 20,
            left: 0,
            // right: 0,
            child: Stack(
              alignment: AlignmentGeometry.bottomCenter,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 10,
                    width: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: 100,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage("assets/drinks/Banana.png"),
                  //   ),
                  // ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fitHeight,
                    // fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
