import 'dart:ffi';

import 'package:caffee_app/global_variable.dart';
import 'package:caffee_app/model/drink_model.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final PageController _pageController = PageController(
    initialPage: indexOfDrink!,
    viewportFraction: 0.6,
  );
  late double _currentPage;
  List<Map<String, Icon>> sizeOfDrink = [
    {"Small": Icon(Icons.local_cafe, size: 20)},
    {"Medium": Icon(Icons.local_cafe, size: 24)},
    {"Large": Icon(Icons.local_cafe, size: 28)},
  ];

  int indexOfSizeSelected = 0;
  bool isHot = true;
  int counterDrinks = 0;

  @override
  initState() {
    super.initState();
    _currentPage = indexOfDrink!.toDouble();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // image of drink
          PageView.builder(
            itemCount: drinks.length,
            controller: _pageController,

            // onPageChanged: (index) {
            //   setState(() {
            //     _currentPage = index;
            //   });
            // },
            itemBuilder: (context, index) {
              // final double scale = _currentPage == index ? 1 : 0.9;
              // final scale = 1 - (_currentPage - index).abs() / drinks.length;
              final scale = 1 - (_currentPage - index).abs() * 1;
              final translateY = (_currentPage - index).abs() * 400;

              return Transform.translate(
                offset: Offset(translateY, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 0.9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentGeometry.bottomCenter,
                        children: [
                          //drink image
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            // height: 500,
                            child: Container(
                              // height: 400,
                              child: Image.asset(
                                drinks[index].image!,
                                height: 450,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          //shadow under drink
                          Positioned(
                            bottom: -20,
                            left: 0,
                            right: 0,
                            // child: Container(
                            //   height: 30,
                            //   width: 10,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(50),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.black38,
                            //         blurRadius: 35,
                            //         spreadRadius: 5,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/drinks/shadow.png",
                                height: 50, //shadow under drink
                                width: 30, //shadow under drink
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // drink name , description and price
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${drinks[_currentPage.toInt()].name} ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        // textAlign: TextAlign.justify,
                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,
                        "${drinks[_currentPage.toInt()].description} ",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Text(
                  " ${drinks[_currentPage.toInt()].price} ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // size of drink
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Flexible(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(3, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              indexOfSizeSelected = index;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: indexOfSizeSelected == index
                                      ? Colors.amber
                                      : Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black87),
                                ),
                                // child: Icon(
                                //   sizeOfDrink[index],
                                //   color: indexOfSizeSelected == index
                                //       ? Colors.white
                                //       : Colors.black87,
                                // ),
                                child: sizeOfDrink[index].values.elementAt(0),
                              ),
                              SizedBox(height: 10),
                              Text(
                                sizeOfDrink[index].keys.elementAt(0),
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black87),
                      ),
                      child: Icon(Icons.arrow_forward, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // siwtch hot and cold drink
          //counter drinks
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              //this sizedbox to determain the height of the widget
              child: SizedBox(
                height: 60,
                //row is determinate the width of the widget
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // switch
                    Expanded(
                      child: Container(
                        // height: double.infinity,
                        // width: double.infinity,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(40),
                        ),

                        //groub of switch Hot and Cold
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isHot = true;
                                  });
                                },
                                child: AnimatedContainer(
                                  curve: Curves.easeInOutBack,
                                  duration: Duration(milliseconds: 500),
                                  alignment: Alignment.center,
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: isHot ? Colors.white : null,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Text(
                                    "Hot",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isHot = false;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  alignment: Alignment.center,
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: !isHot ? Colors.white : null,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Text(
                                    "Cold",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(width: 20),
                    //counter drinks
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(31, 174, 170, 170),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (counterDrinks > 0) {
                                      counterDrinks--;
                                    }
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                              Text(
                                counterDrinks.toString(),
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    counterDrinks++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
