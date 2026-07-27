import 'package:caffee_app/model/drink_model.dart';
import 'package:caffee_app/screens/details.dart';
import 'package:caffee_app/widgets/drink_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Menu',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 24,
                width: 24,
                child: Image.asset("assets/cart.png"),
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: drinks.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,

            // physics: const NeverScrollableScrollPhysics(),
            // padding: const EdgeInsets.only(left: 15, right: 15),
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _scrollController,
                builder: (BuildContext context, Widget? child) {
                  double itemHeight = 180;
                  double scale = 1.0;

                  if (_scrollController.hasClients) {
                    final itemOffset = itemHeight * index;
                    final difference = _scrollController.offset - itemOffset;

                    scale = 1 - (difference.abs() / 600);
                    scale = scale.clamp(0.9, 1.0);
                  }

                  final translateY = (1 - scale);

                  return Transform.translate(
                    offset: Offset(0, translateY),
                    child: Transform.scale(
                      scale: scale,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Details(indexOfDrink: index),
                            ),
                          );
                        },
                        child: MyCardDrink(
                          name: drinks[index].name!,
                          image: drinks[index].image!,
                          price: drinks[index].price!,
                          description: drinks[index].description!,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
