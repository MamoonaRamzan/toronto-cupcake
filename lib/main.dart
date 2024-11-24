/*import 'package:cup_cakes/screens/First_Screen.dart';
import 'package:cup_cakes/screens/Splash_Screen.dart';
import 'package:flutter/material.dart';

import 'screens/RotationScene.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    );
  }
}*/

/*import 'package:cup_cakes/screens/Cart_View.dart';
import 'package:cup_cakes/screens/Cupcake.dart';
import 'package:cup_cakes/screens/Cupcake_Screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import 'Animation/FadeAnimation.dart';

void main() async{
  await PersistentShoppingCart().init();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cupcake_Screen()
    );
  }
}*/
import 'package:cup_cakes/screens/Cart_View.dart';
import 'package:cup_cakes/screens/Check_Out.dart';
import 'package:cup_cakes/screens/Cupcake_Screen.dart';
import 'package:cup_cakes/screens/First_Screen.dart';
import 'package:cup_cakes/screens/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

void main() async{
  await PersistentShoppingCart().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}











