import 'package:caffee_app/global_variable.dart';
import 'package:caffee_app/model/drink_model.dart';
import 'package:flutter/material.dart';

enum EnumSizeDrink { small, medium, large }

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final PageController _pageController = PageController(
    initialPage: indexOfDrink!,
    viewportFraction: 0.6,
  );
  late double _currentPage;

  int indexOfSizeSelected = 0;
  // bool isHot = true;
  // int counterDrinks = 0;

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
          ImagesOfDrinks(
            pageController: _pageController,
            currentPage: _currentPage,
          ),
          // drink details , name , description and price
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: DrinkDetailsWidget(currentPage: _currentPage),
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
                  //size of drink
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                              DrinkSizeButton(
                                indexOfSizeSelected: indexOfSizeSelected,
                                sizeOfDrink: EnumSizeDrink.values[index],
                              ),
                              SizedBox(height: 10),
                              Text(
                                // listOfSizeDrink[index].keys.elementAt(0),
                                EnumSizeDrink.values[index].name,
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
                  //arrow icon
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
          //&
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
                    Expanded(child: SwitchHotCold()),
                    // SizedBox(width: 20),
                    //counter drinks
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: CounterDrinks(),
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

class CounterDrinks extends StatefulWidget {
  const CounterDrinks({super.key});

  @override
  State<CounterDrinks> createState() => _CounterDrinksState();
}

class _CounterDrinksState extends State<CounterDrinks> {
  int counterDrinks = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: TextStyle(color: Colors.black87, fontSize: 22),
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
    );
  }
}

class SwitchHotCold extends StatefulWidget {
  const SwitchHotCold({super.key});

  @override
  State<SwitchHotCold> createState() => _SwitchHotColdState();
}

class _SwitchHotColdState extends State<SwitchHotCold> {
  bool isHot = true;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  style: TextStyle(color: Colors.black87, fontSize: 20),
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
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrinkSizeButton extends StatelessWidget {
  const DrinkSizeButton({
    super.key,
    required this.indexOfSizeSelected,
    required this.sizeOfDrink,
  });

  final int indexOfSizeSelected;
  // final List<Map<String, Icon>> sizeOfDrink;
  final EnumSizeDrink sizeOfDrink;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: sizeOfDrink.index == indexOfSizeSelected
            ? Colors.amber
            : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black87),
      ),
      // child: Icon(
      //   sizeOfDrink[index],
      //   color: indexOfSizeSelectedindexOfSizeSelected == index
      //       ? Colors.white
      //       : Colors.black87,
      // ),

      //values means the icon size
      //keys means the text size
      child: listOfSizeDrink[sizeOfDrink.index].values.elementAt(0),
    );
  }
}

class DrinkDetailsWidget extends StatelessWidget {
  const DrinkDetailsWidget({super.key, required double currentPage})
    : _currentPage = currentPage;

  final double _currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //name of drink and description
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${drinks[_currentPage.toInt()].name} ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
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

        //price of drink
        Text(
          " ${drinks[_currentPage.toInt()].price} ",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ImagesOfDrinks extends StatelessWidget {
  const ImagesOfDrinks({
    super.key,
    required PageController pageController,
    required double currentPage,
  }) : _pageController = pageController,
       _currentPage = currentPage;

  final PageController _pageController;
  final double _currentPage;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: drinks.length,
      controller: _pageController,
      itemBuilder: (context, index) {
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
                      child: Image.asset(
                        drinks[index].image!,
                        height: 450,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    //shadow under drink
                    Positioned(
                      bottom: -20,
                      left: 0,
                      right: 0,

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
    );
  }
}
