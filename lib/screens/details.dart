import 'dart:ffi';

import 'package:caffee_app/model/drink_model.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Details({super.key, required this.indexOfDrink});
  int indexOfDrink;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.60,
  );
  double _currentPage = 0;
  List<IconData> sizeOfDrink = [
    Icons.donut_small,
    Icons.density_medium,
    Icons.donut_large,
    Icons.arrow_forward,
  ];

  int indexOfSizeSelected = 0;
  bool isHot = true;
  int counterDrinks = 0;

  @override
  initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
        // _currentPage = widget.indexOfDrink.toDouble();
      });
    });
    // _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
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
                  scale: scale.clamp(0.5, 1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentGeometry.bottomCenter,
                        children: [
                          //shadow under drink
                          Positioned(
                            bottom: 60,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 30,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 35,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //drink image
                          Image.asset(
                            drinks[index].image!,
                            height: 600,
                            fit: BoxFit.contain,
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
            bottom: 120,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Flexible(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              indexOfSizeSelected = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: indexOfSizeSelected == index
                                  ? Colors.amber
                                  : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black87),
                            ),
                            child: Icon(
                              sizeOfDrink[index],
                              color: indexOfSizeSelected == index
                                  ? Colors.white
                                  : Colors.black87,
                            ),
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
                      child: Icon(sizeOfDrink[3], color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // siwtch hot and cold drink
          //counter drinks
          Positioned(
            bottom: 40,
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
                            color: Colors.black12,
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
