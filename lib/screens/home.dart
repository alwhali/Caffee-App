import 'package:caffee_app/global_variable.dart';
import 'package:caffee_app/model/drink_model.dart';
import 'package:caffee_app/screens/details.dart';
import 'package:caffee_app/widgets/drink_card_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarHome(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 10),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: drinks.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,

            itemBuilder: (context, index) {
              return AnimatedMyListDrinks(
                scrollController: _scrollController,
                indexDrink: index,
              );
            },
          ),
        ),
      ),
    );
  }
}

class AnimatedMyListDrinks extends StatelessWidget {
  const AnimatedMyListDrinks({
    super.key,
    required ScrollController scrollController,
    required int indexDrink,
  }) : _scrollController = scrollController,
       _indexDrink = indexDrink;

  final ScrollController _scrollController;
  final int _indexDrink;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        double itemHeight = 180;
        double scale = 1;
        if (_scrollController.hasClients) {
          final itemOffset = itemHeight * _indexDrink;
          final difference = _scrollController.offset - itemOffset;
          scale = 1.4 - (difference.abs() / 600);
          scale = scale.clamp(0.9, 0.95);
        }

        final translateY = (1 - scale);
        return Transform.translate(
          offset: Offset(0, translateY),
          child: Transform.scale(
            scale: scale,
            child: GestureDetector(
              onTap: () {
                indexOfDrink = _indexDrink;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details()),
                );
              },
              child: MyCardDrink(
                name: drinks[_indexDrink].name!,
                image: drinks[_indexDrink].image!,
                price: drinks[_indexDrink].price!,
                description: drinks[_indexDrink].description!,
              ),
            ),
          ),
        );
      },
    );
  }
}

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      leading: SizedBox.shrink(),
      leadingWidth: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Menu",
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
    );
  }
}
