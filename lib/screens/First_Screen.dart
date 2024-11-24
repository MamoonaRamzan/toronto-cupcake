import 'package:cup_cakes/Animation/FadeAnimation.dart';
import 'package:cup_cakes/screens/RotationScene.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class First_Screen extends StatelessWidget {
  const First_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(now);
    String formattedTime = DateFormat('h:mm:ss a').format(now);
    return  Scaffold(
      body: Center(
        child: FadeAnimation(
          1.1,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image:AssetImage('assets/images/logo.png'),
                      height: 70,
                      width: 70,
                  ),
                  SizedBox(width: 10,),
                  Text("Toronto Cupcakes",
                    style: TextStyle(
                      fontFamily: 'DancingScript',
                      color: Colors.brown,
                      fontSize: 40,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
          Text(
            '$formattedDate',
            style: TextStyle(fontSize: 16),
          ),
              SizedBox(height: 50,),
              MyScener(),
              SizedBox(height: 60,),
              Text("Tastiest treats with the finest ingredients",
                style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: Colors.brown,
                    fontSize: 17.5,
                    //fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text("bring joy with every bite.",
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  color: Colors.pink,
                  fontSize: 30,
                  //fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
