import 'package:cup_cakes/screens/ContactScreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import 'Cart_View.dart';
import 'Cupcake_Screen.dart';
import 'First_Screen.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int cartItemCount = 5; // Example cart item count, replace with your actual data

  final List<Widget> _screens = [
    First_Screen(),
    Cupcake_Screen(),
    CartView(),
    ContactFormScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : size.width * .029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .128,
                  height: index == currentIndex ? size.width * .014 : 0,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                index == 2
                    ? PersistentShoppingCart().showCartItemCountWidget(cartItemCountWidgetBuilder: (itemCount)=>Badge(
                  backgroundColor: Colors.pink,
                  smallSize: 30,
                  label: Text(itemCount.toString()),
                  child: Icon(
                    listOfIcons[index],
                    size: size.width * .076,
                    color: index == currentIndex
                        ? Colors.pink
                        : Colors.black38,
                  ),
                )
                )
                    : Icon(
                  listOfIcons[index],
                  size: size.width * .076,
                  color: index == currentIndex
                      ? Colors.pink
                      : Colors.black38,
                ),
                SizedBox(height: size.width * .03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.cake_rounded,
    Icons.shopping_bag_rounded,
    Icons.chat_rounded,
  ];
}

